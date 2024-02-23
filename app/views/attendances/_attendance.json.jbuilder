json.id attendance.id
json.event attendance.event
json.event_id attendance.event_id
json.user do
  json.first_name attendance.event.user.first_name
  json.profile_image attendance.event.user.profile_image
json.created_at attendance.created_at
json.updated_at attendance.updated_at
end
