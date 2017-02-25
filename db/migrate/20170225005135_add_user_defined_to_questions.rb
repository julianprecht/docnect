class AddUserDefinedToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_defined, :boolean, default: false
  end
end
