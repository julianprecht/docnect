class UserMailer < ApplicationMailer
  # Ideally just user questions helper
  def diagnosis_of(user)
    branch = []
    last = Question.find(user.questions_id)

    if last && last.terminal && last.question.blank?
      while last.parent_id != 0 do
        branch << last
        last = Question.find(last.parent_id)
      end
      branch << last
    end

    branch.reverse
  end

  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Activate Your Docnect Account!'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Reset Your Password'
  end

  def new_patient(doctor, patient)
    @doctor = doctor
    @patient = patient
    @diagnosis = diagnosis_of(patient)
    mail to:doctor.email, subject: "New Diagnosis From #{patient.name}" unless @diagnosis.blank?
  end
end
