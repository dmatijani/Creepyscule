///@desc Destroys the pathfinding grid and path

mp_grid_destroy(pf_grid_floor);
mp_grid_destroy(pf_grid_top);
path_delete(pf_path_floor);
path_delete(pf_path_top);