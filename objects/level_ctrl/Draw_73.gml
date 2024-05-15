///@desc Drawing the night

//Creates the surface if it is deleted
if (!surface_exists(night_surface)) {
	with camera {
		var _surf_w = std_width*zoom;
		var _surf_h = std_height*zoom;
	}
	night_surface = surface_create(_surf_w, _surf_h);
}

//Drawing the surface to the screen
gpu_set_blendmode(bm_subtract);

draw_surface(night_surface, camera.xfollow, camera.yfollow);

gpu_set_blendmode(bm_normal);