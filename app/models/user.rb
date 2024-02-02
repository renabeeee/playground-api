class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :rsvps, dependent: :destroy
  has_many :games, through: :rsvps
  has_many :events, dependent: :destroy

  has_many :orders
	has_many :carted_products

  validates :first_name, :last_name, :email,
  # :username, :location, :birthdate, :experience,
  presence: true

  validates :email, uniqueness: true
  # validates :username, uniqueness: true

	has_secure_password

  attr_accessor :reset_token, :reset_token_sent_at

  def reset_token_valid?
    reset_token_sent_at && reset_token_sent_at > 1.hour.ago
  end
end
