class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :from_date
      t.date :to_date
      t.integer :number_of_person
      t.references  :user, foreign_key: true, index: true
     
      t.timestamps
    end
  end
end
