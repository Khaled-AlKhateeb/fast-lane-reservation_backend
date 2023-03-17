class User < ApplicationRecord
  has_secure_password

  # validation
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}

  # Associations
  has_many :vehicles, dependent: :destroy
  has_many :reservations
end
