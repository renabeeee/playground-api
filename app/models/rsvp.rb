class Rsvp < ApplicationRecord
  validates :description, :location, :date, :time, :intensity, :player_limit, presence: true

end
