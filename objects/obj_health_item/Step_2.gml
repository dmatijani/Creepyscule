///@desc Drawing its light to the surface

if (instance_exists(level_ctrl)) {
	if (surface_exists(level_ctrl.night_surface)) {
		surface_set_target(level_ctrl.night_surface);
		gpu_set_blendmode(bm_subtract);
		
		var _light_size = 0.3 + light_pulse_size*(sin(current_time/light_pulse_divider + light_pulse_offset) + 1);

		draw_sprite_ext(spr_light, 0, x - camera.xfollow, y - camera.yfollow + z - 18, _light_size, _light_size, 0, #FF5387, 1);

		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
}