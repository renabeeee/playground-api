class User < ApplicationRecord
	has_many :games
	has_many :rsvps

  validates :first_name, :last_name, :username, :email, :location, :birthdate, :experience, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true

	has_secure_password

end
