///@desc Removes the grid

ds_grid_destroy(depth_grid);
if (surface_exists(shadow_surface)) {
	surface_free(shadow_surface);
}