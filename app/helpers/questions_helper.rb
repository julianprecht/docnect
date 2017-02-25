module QuestionsHelper
  def diagnosis_of(user)
    branch = []
    last = Question.find(user.questions_id)
    
    if last&.terminal && last.question.blank?
      while last.parent_id != 0 do
        branch << last
        last = Question.find(last.parent_id)
      end
      branch << last
    end

    branch.reverse
  end
end
