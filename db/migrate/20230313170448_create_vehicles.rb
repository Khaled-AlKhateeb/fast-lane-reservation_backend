class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model
      t.decimal :price
      t.text :description
      t.string :image
      t.string :horse_power
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
