class Game < ApplicationRecord
  belongs_to :user
  has_many :rsvps

  def player_count
    rsvps.count
  end

  def update_player_count
    update(player_count: rsvps.count)
  end

  validates :player_limit, numericality: { only_integer: true, greater_than: 9, less_than_or_equal_to: 15 }

  validates :title, :location, :date, :time, :intensity, :player_limit, :image_url, presence: true
end
