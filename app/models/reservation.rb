class Reservation < ApplicationRecord
  belongs_to :user
  # belongs_to :vehicle
  validates :from_date, :to_date, presence: true
  
end
