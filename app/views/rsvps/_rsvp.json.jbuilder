json.id rsvp.id
json.game rsvp.game
json.game rsvp.game
json.user do
  json.first_name rsvp.game.user.first_name
  json.profile_image rsvp.game.user.profile_image
json.created_at rsvp.created_at
json.updated_at rsvp.updated_at
end
