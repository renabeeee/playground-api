class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :rsvps, dependent: :destroy
  has_many :games, through: :rsvps
  has_many :events, dependent: :destroy
  belongs_to :rsvp

  has_many :orders
	has_many :carted_products

  validates :first_name,:email,
  # :last_name,
  # :username, :location, :birthdate, :experience,
  presence: true

  validates :email, uniqueness: true
  # validates :username, uniqueness: true

	has_secure_password

  attr_accessor :password_reset_token, :password_reset_sent_at


#   def send_password_reset
#     generate_token(:password_reset_token)
#     self.password_reset_sent_at = Time.zone.now
#     save!
#     UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
#   end


#   # This generates a random password reset token for the user
#   def generate_token(column)
#     begin
#       self[column] = SecureRandom.urlsafe_base64
#     end while User.exists?(column => self[column])
#   end
end
