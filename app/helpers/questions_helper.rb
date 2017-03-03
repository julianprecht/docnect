module QuestionsHelper
  def diagnosis_of(user)
    branch = []
    last = Question.find(user.questions_id)
    
    if last && last.terminal && last.question.blank?
      while last.parent_id do
        branch << last
        last = Question.find(last.parent_id)
      end
      branch << last
    end

    branch.reverse
  end

  def count_patients
    count = Appointment.all.where(doctor_id: current_user.id, seen: false).length
    if count == 0
      count = 'none'
    end
    count
  end
end
