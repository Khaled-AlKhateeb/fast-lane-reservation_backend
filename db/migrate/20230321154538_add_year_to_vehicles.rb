class AddYearToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :year, :integer
  end
end
