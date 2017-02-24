class Answer < ApplicationRecord
  belongs_to :parent, :class_name => 'Question'
  belongs_to :next, :class_name => 'Question'
end
