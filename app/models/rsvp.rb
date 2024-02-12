class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :users

  after_create :update_player_count
  after_destroy :update_player_count

  validates :user_id, uniqueness: { scope: :game_id }

  private

  def update_player_count
    game.update_player_count
  end
end
