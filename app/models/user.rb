class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :rsvps, dependent: :destroy
  has_many :games, through: :rsvps
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances

  has_many :orders
	has_many :carted_products

  validates :first_name,:email, presence: true

  validates :email, uniqueness: true

	has_secure_password
end
