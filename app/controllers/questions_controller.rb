class QuestionsController < ApplicationController
  include ActionView::Helpers::DateHelper
  # Catch question record not found exception
  rescue_from ActiveRecord::RecordNotFound, :with => :question_not_found
  def question_not_found
    flash[:danger] = 'Something went wrong, please try again.'
    redirect_to test_path
  end

  before_action :require_patient
  before_action :require_incomplete, only: [:test, :new, :create, :appointment, :appoint]
  before_action :require_user_input, only: [:new]
  before_action :require_test_question, only: [:test]
  before_action :require_appointment, only: [:appointment]

  # Show current question and all answers
  def test
    @question = Question.find(current_user.questions_id)
    @answers = Question.all.where(parent_id: current_user.questions_id)
  end

  # Post update to user question record
  def update
    @user = current_user
    @answer = Question.find(params[:answer_id])
    @question = Question.find(current_user.questions_id)

    # Only update if answer exists and is a valid child of the current question (or reset to question 1)
    unless @answer && (@answer.parent_id == @user.questions_id || @answer.id == 1) && @user.update_column(:questions_id, @answer.id)
      flash[:danger] = 'Something went wrong, please try again.'
      redirect_to test_path
      return
    end

    # Reset test completion flag
    if @user.test_complete
      @user.update_attribute(:test_complete, false)

      @appointments = Appointment.all.where(patient_id: @user.id)
      @appointments.each do |appointment|
        appointment.destroy
      end
    end

    if @answer.terminal && @answer.question != ''
      # Test requires user input at end of branch
      redirect_to test_input_path
    elsif @answer.terminal
      # End of test, appoint doctor(s)
      redirect_to test_appointment_path
    else
      # Continue test
      redirect_to test_path
    end

    # Remove user defined records when they are no longer used to save storage
    if @question.user_defined
      @question.destroy
    end
  end

  # User input at end of branch
  def new
    @question = Question.find(current_user.questions_id)
    @answer = Question.new
  end

  def create
    @question = Question.find(current_user.questions_id)
    @answer = Question.new(answer_params)
    @answer.terminal = true
    @answer.parent_id = @question.id
    @answer.diagnosis = @question.diagnosis
    @answer.user_defined = true

    if @answer.save && current_user.update_column(:questions_id, @answer.id)
      # End of test, appoint doctor(s)
      redirect_to test_appointment_path
    else
      render 'new'
    end
  end

  def appointment
    @doctors = User.all.where(activated: true, user_group: 2).where.not(specialization: nil, phone: nil, address: nil)
    @doctors.each do |doctor|
      doctor.name += ' | ' + doctor.specialization + ' | ' + doctor.address
    end
  end

  def appoint
    @user = current_user
    @doctors = User.all.where(activated: true, user_group: 2).where.not(specialization: nil, phone: nil, address: nil)
    @doctors.each do |doctor|
      doctor.name += ' | ' + doctor.specialization + ' | ' + doctor.address
    end

    @doctor_ids = params[:doctor_ids]
    if !@doctor_ids
      flash.now[:danger] = 'Please select at least one doctor.'
      render 'appointment'
    else
      @doctor_ids.each do |doctor_id|
        doctor = User.all.where(id: doctor_id).first

        appointment = nil
        appointment = Appointment.new(doctor: doctor, patient: @user) if doctor

        if appointment && appointment.save
          @user.update_attribute(:test_complete, true)
          UserMailer.new_patient(doctor, @user).deliver_now
        end
      end

      if @user.test_complete
        @user.update_column(:last_test, Time.zone.now)
        flash[:success] = 'Thanks for completing the diagnosis test.'
        redirect_to @user
      else
        flash.now[:danger] = 'Something went wrong, please try again.'
        render 'appointment'
      end
    end
  end

private

  def answer_params
    params.require(:question).permit(:answer)
  end

  def require_patient
    unless current_user.group?(1)
      redirect_to current_user
    end
  end

  def require_user_input
    @question = Question.find(current_user.questions_id)

    if @question.terminal && @question.question.blank?
      # If question is terminal and question field is blank, end of test
      redirect_to test_appointment_path
    elsif !@question.terminal
      # If question is not terminal show current question
      redirect_to test_path
    end
  end

  def require_test_question
    @question = Question.find(current_user.questions_id)

    if @question.terminal
      # If the current question is terminal but has a question, redirect to user input
      if !@question.question.blank?
        redirect_to test_input_path
      # Otherwise, end of test: go to appointment
      else
        redirect_to test_appointment_path
      end
    end
  end

  def require_appointment
    @question = Question.find(current_user.questions_id)

    if @question.terminal && !@question.question.blank?
      # If the question is terminal but not blank, redirect to user input
      redirect_to test_input_path
    elsif !@question.terminal
      # Otherwise, show the current question
      redirect_to test_path
    end
  end

  def require_incomplete
    if current_user.test_complete
      flash[:warning] = "Your last test was completed #{time_ago_in_words(current_user.last_test)} ago. To start another one, click 'Begin New Test' under 'Diagnostic Test'."
      redirect_to current_user
    end
  end
end
