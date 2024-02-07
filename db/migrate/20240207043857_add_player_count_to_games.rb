class AddPlayerCountToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :player_count, :integer, default: 0
  end
end
