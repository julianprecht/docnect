class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      # User groups: 0=super user, 1=patient, 2=doctor
      t.integer :user_group, default: 1
      t.string :name

      # DOCTOR SPECIFIC RECORDS
      t.string :specialization
      t.string :phone
      t.text :address
      t.text :bio, default: ''

      # PATIENT SPECIFIC RECORDS
      t.datetime :dob
      # Nationalities - could be drop down box?
      t.text :nationality
      t.string :marital_status
      t.string :occupation
      t.text :hobbies
      # Languages - could be drop down box?
      t.text :languages
      t.integer :age
      t.integer :height
      t.integer :weight
      t.text :allergies
      t.text :smoke
      t.text :alcohol
      t.text :tattoos
      t.text :history
      t.text :medication
      t.boolean :drugs
      t.text :illness

      t.timestamps
    end
  end
end
