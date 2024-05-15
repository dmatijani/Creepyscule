///@desc Drawing itself

//Some drawing variables
var _is_swinging = false;
var _plr_sprite = sprite_index;
if (item != -1) { //If the player has an item
	if (swing_prog != -1) { //If the sword is swinging
		_is_swinging = true;
		_plr_sprite = spr_player_no_arm;
	}
}

//Sets the drawing color to red
if (invincible_countdown > 0) shader_set(sha_hurt);

//Drawing the player sprite
draw_sprite_ext(_plr_sprite, image_index, x, y + z, 2*facing, 2, 0, c_white, 1);

//Drawing the sword arm
if (_is_swinging) {
	//Some variables
	var _ax = x - 10*facing;
	var _ay = y - 22 + z;
	var _a_angle = 90 - 180*swing_prog*facing;
	var _sx = _ax + lengthdir_x(16, _a_angle);
	var _sy = _ay + lengthdir_y(16, _a_angle);
	var _s_angle = _a_angle - 45*facing + 180*(facing == -1);
	
	//Drawing the sword
	draw_sprite_ext(item.sprite, 0, _sx, _sy, 2*facing, 2, _s_angle, c_white, 1);
	
	//Drawing the arm sprite
	draw_sprite_ext(spr_player_arm, 0, _ax, _ay, 2, 2*facing, _a_angle, c_white, 1);
}

if (invincible_countdown > 0) shader_reset();

//Drawing the sword swing
if (_is_swinging) {
	draw_sprite_ext(spr_sword_swipe, sprite_get_number(spr_sword_swipe)*swing_prog, x, y + z - 30, facing*item.size*2, item.size*2, 0, item.swing_color, 1);
}