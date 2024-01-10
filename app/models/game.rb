class Game < ApplicationRecord
  belongs_to :user

  validates :description, :location, :date, :time, :intensity, :player_limit, presence: true

end
