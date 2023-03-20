class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :reservations
    drop_table :vehicles
    drop_table :users
  end
end
