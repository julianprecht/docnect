class AddSeenToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :seen, :boolean, default: false
  end
end
