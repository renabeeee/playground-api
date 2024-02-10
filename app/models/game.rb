class Game < ApplicationRecord
  belongs_to :user
  has_many :rsvps

  mount_uploader :image_url, ImageUrlUploader

  # validates :title, :location, :date, :time, :intensity, :player_limit, presence: true

  def player_count
    rsvps.count
  end

  def update_player_count
    update(player_count: rsvps.count)
  end

end
