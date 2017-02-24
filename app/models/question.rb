class Question < ApplicationRecord
  belongs_to :parent, :class_name => 'Question'
  has_many :children, :class_name => 'Question', :foreign_key => 'parent_id', dependent: :destroy

  auto_strip_attributes :answer

  # Validate only if user input
  validates :answer,
            presence: true,
            if: :user_input?

private

  def user_input?
    terminal && Question.find(parent_id).question != ''
  end
end
