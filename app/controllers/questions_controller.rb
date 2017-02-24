class QuestionsController < ApplicationController
  # Catch question record not found exception
  rescue_from ActiveRecord::RecordNotFound, :with => :question_not_found
  def question_not_found
    flash[:danger] = 'Something went wrong, please try again.'
    redirect_to test_path
  end

  # Ensure users cannot input unless their current question requires
  before_action :require_user_input, only: [:new]
  before_action :check_user_input, only: [:test]

  # Show current question and all answers
  def test
    @question = Question.find(current_user.questions_id)
    @answers = Question.all.where(parent_id: current_user.questions_id)

    # If test is already complete, redirect to user page
    if @question.terminal
      flash[:warning] = "You've already completed this test. To start another one, click 'Begin New Test' under 'Diagnostic Test'."
      redirect_to current_user
    end
  end

  # Post update to user question record
  def update
    @user = current_user
    @answer = Question.find(params[:answer_id])

    # Only update if answer exists and is a valid child of the current question (or reset to question 1)
    unless @answer && (@answer.parent_id == @user.questions_id || @answer.id == 1) && @user.update_column(:questions_id, @answer.id)
      flash[:danger] = 'Something went wrong, please try again.'
      redirect_to test_path
      return
    end

    if @answer.terminal && @answer.question != ''
      # Test requires user input at end of branch
      redirect_to test_input_path
    elsif @answer.terminal
      # End of test
      @user.update_column(:last_test, Time.zone.now)
      flash[:success] = 'Thanks for completing the test.'
      redirect_to current_user
    else
      # Continue test
      redirect_to test_path
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

    if @answer.save && current_user.update_column(:questions_id, @answer.id)
      # End of test
      current_user.update_column(:last_test, Time.zone.now)
      flash[:success] = 'Thanks for completing the test.'
      redirect_to current_user
    else
      # Just in case answer saves but column update fails
      if Question.find(@answer.id)
        @answer.destroy
      end
      # Throw error
      flash[:danger] = 'Something went wrong, please try again.'
      redirect_to test_input_path
    end
  end

private

  def answer_params
    params.require(:question).permit(:answer)
  end

  def require_user_input
    @question = Question.find(current_user.questions_id)
    unless @question.terminal && @question.question != ''
      redirect_to test_path
    end
  end

  def check_user_input
    @question = Question.find(current_user.questions_id)
    if @question.terminal && @question.question != ''
      redirect_to test_input_path
    end
  end
end
