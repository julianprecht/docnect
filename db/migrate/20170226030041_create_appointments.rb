class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :doctor
      t.references :patient

      t.timestamps
    end
    add_index :appointments, [:doctor_id, :patient_id], unique: true
    add_foreign_key :appointments, :users, column: :doctor_id
    add_foreign_key :appointments, :users, column: :patient_id
  end
end
