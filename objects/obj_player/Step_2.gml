///@desc Drawing its light to the surface

if (instance_exists(level_ctrl)) {
	if (surface_exists(level_ctrl.night_surface)) {
		surface_set_target(level_ctrl.night_surface);
		gpu_set_blendmode(bm_subtract);

		draw_sprite_ext(spr_light, 0, x - camera.xfollow, y - camera.yfollow + z - 16, 0.4, 0.45, 0, c_white, 1);

		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
}