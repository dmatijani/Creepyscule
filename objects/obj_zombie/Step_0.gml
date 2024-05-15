///@desc Following the player

event_inherited(); //Standard event

//Movement towards a point
if (can_move) {
	if ((point_distance(x, y, poi_x, poi_y) < 20) || randomly_move) { //If the enemy is very close to the point of interest
		//Updates the path
		mp_grid_path(pf_grid_floor, pf_path_floor, x, y, obj_player.x, obj_player.y, true);
		mp_grid_path(pf_grid_top, pf_path_top, x, y, obj_player.x, obj_player.y, true);
		
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
if (hsp != 0) facing = sign(hsp);

//Animating the sprite
var _spd = (abs(hsp) + abs(vsp));
if (_spd > 0.01) {
	image_speed = 0.1;
} else {
	image_speed = 0;
	image_index = 0;
}