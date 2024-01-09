class Game < ApplicationRecord
  has_many :users
	belongs_to :game
	belongs_to :rsvp

  validates :description, :location, :date, :time, :intensity, :player_limit, presence: true

end
