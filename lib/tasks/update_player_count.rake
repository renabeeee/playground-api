namespace :update do
  # desc "Update player count for all games"
  # task player_count: :environment do
  #   Game.find_each do |game|
  #     game.update(player_count: game.rsvps.count)
  #   end
  # end
  #
  desc "Update profile images for existing users"
  task profile_images: :environment do
    default_image_url = "https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2281862025.jpg"
    User.where(profile_image: nil).update_all(profile_image: default_image_url)
end
end
