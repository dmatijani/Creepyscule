///@desc Movement and items

//Lowers the invincibility countdown
if (invincible_countdown > 0) invincible_countdown --;

//Keyboard keys
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_jump = keyboard_check_pressed(vk_space);

//Getting the movement
var _mov_hor = (key_right - key_left);
var _mov_vert = (key_down - key_up);

//Changing the horizontal and vertical speed
var _mov_dir = point_direction(0, 0, _mov_hor, _mov_vert);
var _is_moving = (_mov_hor != 0) || (_mov_vert != 0);
hsp = approach(hsp, lengthdir_x(max_spd, _mov_dir)*_is_moving, acc);
vsp = approach(vsp, lengthdir_y(max_spd, _mov_dir)*_is_moving, acc);

//Jumping and gravity
if (key_jump) {
	if (place_meeting_z(x, y, z + 1, obj_solid)) zsp = -jump_spd;
}
zsp += grav;

//Collision
if (hsp != 0) { //Horizontal
	var _hs = sign(hsp);
	if (place_meeting_z(x + hsp + _hs, y, z, obj_solid)) {
		if (!place_meeting_z(floor(x) + (_hs < 0), y, z, obj_solid)) x = floor(x) + (_hs < 0);
		while (!place_meeting_z(x + _hs, y, z, obj_solid)) x += _hs;
		
		hsp = 0;
	}
}

if (vsp != 0) { //Vertical
	var _vs = sign(vsp);
	if (place_meeting_z(x, y + vsp + _vs, z, obj_solid)) {
		if (!place_meeting_z(x, floor(y) + (_vs < 0), z, obj_solid)) y = floor(y) + (_vs < 0);
		while (!place_meeting_z(x, y + _vs, z, obj_solid)) y += _vs;
		
		vsp = 0;
	}
}
if (zsp != 0) { //Z axis
	var _zs = sign(zsp);
	if (place_meeting_z(x, y, z + zsp + _zs, obj_solid)) {
		if (!place_meeting_z(x, y, floor(z) + (_zs < 0), obj_solid)) z = floor(z) + (_zs < 0);
		while (!place_meeting_z(x, y, z + _zs, obj_solid)) z += _zs;
		
		zsp = 0;
	}
}

//Changes the X and Y
x += hsp;
y += vsp;
z += zsp;

//Changing the facing
if (swing_prog == -1) {
	if (hsp != 0) facing = sign(hsp);
}

//Item usage
key_attack = keyboard_check_pressed(ord("A")); //A as in attack, ha!
if (key_attack) { //If the player presses the attack key
	if (!place_meeting_z(x, y, z, obj_item)) { //If there is not an item in the ground
		if (item != -1) {
			if (swing_prog == -1) { //If the player is not swinging the sword
				swing_prog = 0;
				
				//Plays the swing sound
				audio_play_sound(snd_swing, 10, false);
			
				//Creates the damage object
				if (my_damage == noone) {
					if (!instance_exists(my_damage)) {
						my_damage = instance_create_layer(-99, -99, layer, obj_damage);
						var _id = id;
						var _dmg = item.damage;
						var _kb = item.knockback;
						var _dmg_w = 30*item.size;
						var _dmg_h = 40*item.size;
						var _dmg_height = 80;
						with my_damage {
							owner = _id; //Who is the owner of this damage
							damage = _dmg; //Sets the damage to the obj_damage
							knockback = _kb;
							image_xscale = _dmg_w/sprite_width;
							image_yscale = _dmg_h/sprite_height;
							height = _dmg_height;
						}
					}
				}
			}
		}
	} else { //If there is an item in the ground
		var _item_to_pick_up = instance_place(x, y, obj_item);
		if ((_item_to_pick_up.my_item) == 100) { //If the item is a health pickup
			if (life < max_life) { //If the player isn't at maximum life
				life += _item_to_pick_up.healing;
				if (life > max_life) life = max_life;
				with (_item_to_pick_up) instance_destroy();
				
				if (instance_exists(level_ctrl)) {
					with (level_ctrl) hurt_countdown = 1;
				}
			}
		} else { //If the item is a regular item
			if (item == -1) { //If the player is not holding anything
				item = _item_to_pick_up.my_item;
				
				if ((level_ctrl.timer == -1) && (level_ctrl.night_state == 0)) {
					//Starts the actual game
					with (level_ctrl) {
						timer = day_time + morning_and_evening_time;
						if (help_text == 0) help_text = 1;
					}
				}
				
				with (_item_to_pick_up) instance_destroy();
			} else { //Swaps the items around
				var _temp = item;
				item = _item_to_pick_up.my_item;
				_item_to_pick_up.my_item = _temp;
			}
		}
	}
}
	
//Continues the swing
if (swing_prog != -1) { //If the sword is being swung
	swing_prog += 1/item.swing_time;
		
	//Changes the damage
	var _dmg_x = x + facing*15*item.size;
	var _dmg_y = y;
	var _dmg_z = z;
	with (my_damage) {
		x = _dmg_x;
		y = _dmg_y;
		z = _dmg_z;
	}
		
	if (swing_prog >= 1) {
		swing_prog = -1;
			
		if (instance_exists(my_damage)) {
			with (my_damage) instance_destroy();
			my_damage = noone;
		}
	}
}

//Animating the sprite
var _spd = (abs(hsp) + abs(vsp));
if (_spd > 0.01) {
	image_speed = 0.15;
} else {
	image_speed = 0;
	image_index = 0;
}