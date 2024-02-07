namespace :update do
  desc "Update player count for all games"
  task player_count: :environment do
    Game.find_each do |game|
      game.update(player_count: game.rsvps.count)
    end
  end
end
