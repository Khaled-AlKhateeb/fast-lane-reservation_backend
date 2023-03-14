class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, :model, :price, :description, :image, :horse_power, presence: true
end
