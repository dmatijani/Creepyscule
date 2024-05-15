///@desc Draws the "night" to the surface

if (surface_exists(night_surface)) {
	with camera {
		var _surf_w = std_width*zoom;
		var _surf_h = std_height*zoom;
	}
	
	if (night <= 0.5) {
		var _night_color = merge_color(c_black, evening_color, night*2);
	} else {
		var _night_color = merge_color(evening_color, night_color, (night - 0.5)*2);
	}
	
	surface_set_target(night_surface);
	draw_sprite_ext(spr_pixel, 0, 0, 0, _surf_w, _surf_h, 0, _night_color, 1);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(spr_pixel, 0, 0, 0, _surf_w, _surf_h, 0, c_black, 1);
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
}