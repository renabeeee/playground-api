class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :description, :location, :date, :time, :intensity, :player_limit, presence: true

end
