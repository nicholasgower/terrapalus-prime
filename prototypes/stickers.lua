-- stickers.lua
data:extend({
      {
        type = "sticker",
        name = "inhibitor-slowdown-sticker",
        flags = {"not-on-map"},
        duration_in_ticks = 1800, -- 1 second of effect
        target_movement_modifier = 0.1, -- 10% normal speed
    }
  })