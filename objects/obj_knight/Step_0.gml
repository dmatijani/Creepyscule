///@desc Following the player

event_inherited(); //Standard event

//Movement towards a point
if (can_move) {
	if ((point_distance(x, y, poi_x, poi_y) < 20) || randomly_move) { //If the enemy is very close to the point of interest
		//Seeking variable
		var _seek_x = obj_player.x - 48*facing;
		
		//Updates the path
		mp_grid_path(pf_grid_floor, pf_path_floor, x, y, _seek_x, obj_player.y, true);
		mp_grid_path(pf_grid_top, pf_path_top, x, y, _seek_x, obj_player.y, true);
		
		//Sets a new point of interest
		var _player_on_solid = false;
		with (obj_player) {
			if (place_meeting(x, y, obj_solid)) _player_on_solid = true;
		}
		if ((_player_on_solid || place_meeting(x, y, obj_solid) || choose(1, 0))) {
			poi_x = path_get_point_x(pf_path_top, 1);
			poi_y = path_get_point_y(pf_path_top, 1);
		} else {
			poi_x = path_get_point_x(pf_path_floor, 1);
			poi_y = path_get_point_y(pf_path_floor, 1);
		}
		
		randomly_move = false;
	}
}

//Changes the horizontal and vertical speed
var _mov_dir = point_direction(x, y, poi_x, poi_y);
hsp = approach(hsp, lengthdir_x(max_spd, _mov_dir), acc);
vsp = approach(vsp, lengthdir_y(max_spd, _mov_dir), acc);

//Tries to jump
if (hsp != 0 || vsp != 0) {
	if (place_meeting_z(x + hsp + 2*sign(hsp), y + vsp + 2*sign(vsp), z, obj_solid)) {
		jumping = true;
	}
}

//Jumping and gravity
if (jumping) {
	if (place_meeting_z(x + hsp + sign(hsp), y + vsp + sign(vsp), z, obj_solid)) {
		if (place_meeting_z(x, y, z + 1, obj_solid)) zsp = -jump_spd;
	}
	jumping = false;
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
attack = false;

//Starts attacking the player
if (no_swing_timer == 0) {
	if (item != -1) { //If the knight has an item
		if (distance_to_object(obj_player) < (70*item.size)) {
			if (abs(obj_player.z - z) < 20) {
				attack = true; //If the player is close to the knight
			}
		}
	}
}

if (attack) { //If the knight is close to attacking
	if (swing_prog == -1) { //If the knight is not swinging the sword
		swing_prog = 0;
		
		//Rotates towards the player
		facing = sign(obj_player.x - x);
		if (facing == 0) facing = choose(-1, 1);
		
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
	
	attack = false; //Sets attack to false
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
			no_swing_timer = irandom_range(60, 150);
		}
	}
}

//Lowers the no swing timer
if (no_swing_timer > 0) no_swing_timer --;

//Animating the sprite
var _spd = (abs(hsp) + abs(vsp));
if (_spd > 0.01) {
	image_speed = 0.07;
} else {
	image_speed = 0;
	image_index = 0;
}