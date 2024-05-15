///@desc Creates the depth grid

depth_grid = ds_grid_create(3, 1); //instance, floor, coords

shadow_surface = surface_create(1, 1);

alarm[0] = 1; //Surface resizing alarm

cx = 0;
cy = 0;