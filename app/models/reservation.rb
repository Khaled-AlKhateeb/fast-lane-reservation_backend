class Reservation < ApplicationRecord
  validates :from_date, :to_date, presence: true
  validate :to_date_after_from_date
  validates :number_of_person, numericality: { greater_than: 0, only_integer: true }, presence: true

  belongs_to :user
  belongs_to :vehicle
end
