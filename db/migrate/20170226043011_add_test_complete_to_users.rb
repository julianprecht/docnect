class AddTestCompleteToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :test_complete, :boolean, default: false
  end
end
