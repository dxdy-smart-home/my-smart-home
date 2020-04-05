"""
Say text
"""

media_id = data.get("media_id")
message = data.get("message")

saved_media_attributes = hass.states.get(media_id).attributes.copy()
saved_media_attributes['state'] = hass.states.get(media_id).state

hass.services.call("media_player", "turn_off", {
  "entity_id": media_id
})

hass.services.call("media_player", "turn_on", {
  "entity_id": media_id
})

hass.services.call("media_player", "volume_set", {
  "entity_id": media_id,
  "volume_level": 0.9
})

hass.services.call("tts", "google_translate_say", {
  "entity_id": media_id,
  "message": message
})

while hass.states.get(media_id).state == 'playing':
  time.sleep(1)

if saved_media_attributes['state'] == 'playing':
  hass.services.call("media_player", "play_media", {
    "entity_id": media_id,
    "media_content_id": saved_media_attributes['media_content_id'],
    "media_content_type": saved_media_attributes['media_content_type']
  })

  hass.services.call("media_player", "volume_set", {
    "entity_id": media_id,
    "volume_level": saved_media_attributes['volume_level']
  })
else:
  hass.services.call("media_player", "volume_set", {
    "entity_id": media_id,
    "volume_level": 0.8
  })
