json.id game.id
json.title game.title
json.location game.location
json.date game.date
json.time game.time
json.intensity game.intensity
json.player_limit game.player_limit
json.image_url game.image_url
json.created_at game.created_at
json.updated_at game.updated_at
json.user do
  json.first_name game.user.first_name
  json.profile_image game.user.profile_image
end
