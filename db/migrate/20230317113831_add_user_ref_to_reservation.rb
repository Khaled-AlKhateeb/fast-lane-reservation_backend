class AddUserRefToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, foreign_key: true, index: true
  end
end
