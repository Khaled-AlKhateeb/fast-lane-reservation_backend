class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, :model, :price, :description, :image, :horse_power, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
