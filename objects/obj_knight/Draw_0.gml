///@desc Draws itself

//Some drawing variables
var _is_swinging = false;
var _kn_sprite = sprite_index;
if (item != -1) { //If the player has an item
	if (swing_prog != -1) { //If the sword is swinging
		_is_swinging = true;
		_kn_sprite = spr_knight_no_arm;
	}
}

//Sets the hurt color to red
if (invincible_countdown > 0) shader_set(sha_hurt);

//Drawing the knight sprite
var _sign = sign(obj_player.x - x);
if (_sign == 0) _sign = 1;
draw_sprite_ext(_kn_sprite, image_index, x, y + z, 2*_sign, 2, 0, c_white, 1);

//Drawing the sword arm
if (_is_swinging) {
	//Some variables
	var _ax = x - 10*facing;
	var _ay = y - 24 + z;
	var _a_angle = 90 - 180*swing_prog*facing;
	var _sx = _ax + lengthdir_x(16, _a_angle);
	var _sy = _ay + lengthdir_y(16, _a_angle);
	var _s_angle = _a_angle - 45*facing + 180*(facing == -1);
	
	//Drawing the sword
	draw_sprite_ext(item.sprite, 0, _sx, _sy, 2*facing, 2, _s_angle, c_white, 1);
	
	//Drawing the arm sprite
	draw_sprite_ext(spr_knight_arm, 0, _ax, _ay, 2, 2*facing, _a_angle, c_white, 1);
}

if (invincible_countdown > 0) shader_reset();

//Drawing the sword swing
if (_is_swinging) {
	draw_sprite_ext(spr_sword_swipe, sprite_get_number(spr_sword_swipe)*swing_prog, x, y + z - 30, facing*item.size*2, item.size*2, 0, item.swing_color, 1);
}