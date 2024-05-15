///@desc Sorting the objects by depth

//Adds every instance to the grid
var _counter = 0;
var _dg = depth_grid;
ds_grid_resize(_dg, 3, instance_number(obj_game_object));
with (obj_game_object) {
	_dg[# 0, _counter] = id;
	var _fo = floor_object;
	_dg[# 1, _counter] = _fo;
	_dg[# 2, _counter] = bbox_bottom;
	if (_fo) _dg[# 2, _counter] = bbox_top;
	
	_counter ++;
}

//Sorts the grid by the y + z
ds_grid_sort(depth_grid, 2, true);

//Draws the shadow surface to the screen
draw_surface_ext(shadow_surface, cx, cy, 1, 1, 0, c_white, 0.3);

//Draws the non-floor instances
for (var i = 0; i < _counter; i ++) {
	var _inst = depth_grid[# 0, i];
	var _floor_obj = depth_grid[# 1, i];
	var _x, _y, _z, _sw, _sh, _h;
	with (_inst) {
		if _floor_obj {
			_x = x;
			_y = y;
			_z = z;
			_sw = sprite_width;
			_sh = sprite_height;
			_h = height;
		}
		event_perform(ev_draw, 0);
	}
	if (_floor_obj) { //If it is a floor object, copies part of the shadow
		//draw_surface_part_ext(shadow_surface, _x - cx, _y - cy, _sw, _sh, _x, _y + _z - _h, 1, 1, c_white, 0.3);
	}
}