class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :parent
      t.text :answer, default: ''
      t.text :question, default: ''
      t.boolean :terminal, default: false
      t.text :diagnosis, default: "The patient's input was insufficient to give a successful diagnosis. More tests are needed."

      t.timestamps
    end
    add_foreign_key :questions, :questions, column: :parent_id
  end
end
