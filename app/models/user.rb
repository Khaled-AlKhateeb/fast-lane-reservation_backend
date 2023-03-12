class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validation
  validates :f_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :password, presence: true
  
  # Associations
  has_many :vehicles
  has_many :reservations
end
