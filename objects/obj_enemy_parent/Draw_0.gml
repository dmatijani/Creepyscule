///@desc Drawing self hurt (standard enemy draw event)

if (invincible_countdown > 0) shader_set(sha_hurt);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, _dc, 1);

if (invincible_countdown > 0) shader_reset();