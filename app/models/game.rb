class Game < ApplicationRecord
  # belongs_to :user
	# belongs_to :rsvp

  validates :description, :location, :date, :time, :intensity, :player_limit, presence: true

end
