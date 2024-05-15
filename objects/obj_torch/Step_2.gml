///@desc Drawing its light to the surface

if (instance_exists(level_ctrl)) {
	if (surface_exists(level_ctrl.night_surface)) {
		surface_set_target(level_ctrl.night_surface);
		gpu_set_blendmode(bm_subtract);

		draw_sprite_ext(spr_light, 0, x - camera.xfollow, y - camera.yfollow + z - 30, light_size_percentage, light_size_percentage, 0, merge_color(c_white, c_yellow, light_color_percentage), 1);

		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
}