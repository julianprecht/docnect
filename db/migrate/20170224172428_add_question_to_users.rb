class AddQuestionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :questions, default: 1
    add_foreign_key :users, :questions
  end
end
