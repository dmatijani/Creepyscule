///@desc Adds the solids to the grid

var _grid_floor = pf_grid_floor;
var _grid_top = pf_grid_top;

with (obj_solid) {
	if (height >= 60) {
		mp_grid_add_instances(_grid_floor, id, true);
		mp_grid_add_instances(_grid_top, id, true);
	} else {
		mp_grid_add_instances(_grid_floor, id, true);
	}
}

can_move = true;