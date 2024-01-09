class User < ApplicationRecord
  has_many :usernames
	belongs_to :game
	belongs_to :rsvp

  validates :first_name, :last_name, :username, :pronouns, :email, :location, :birthdate, :experience, presence: true
  validates :email, uniqueness: true
	has_secure_password
	has_one_attached :profile_image

  before_create :set_default_profile_image

  private

  def set_default_profile_image
    unless profile_image.attached?
      profile_image.img_src="https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg"

    end
  end
end
