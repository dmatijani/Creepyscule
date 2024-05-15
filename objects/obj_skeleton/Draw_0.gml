///@desc Draws itself

if (invincible_countdown > 0) shader_set(sha_hurt);

var _sign = sign(obj_player.x - x);
if (_sign == 0) _sign = 1;
draw_sprite_ext(sprite_index, image_index, x, y + z, 2*_sign, 2, 0, c_white, 1);

if (invincible_countdown > 0) shader_reset();