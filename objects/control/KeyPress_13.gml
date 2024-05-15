///@desc Resizing the game window

if (!keyboard_check(vk_alt)) exit;

if (!window_get_fullscreen()) { //Sets the window to fullscreen
	window_set_fullscreen(true);
	surface_resize(application_surface, display_get_width(), display_get_height());
} else { //Sets the window to windowed
	window_set_fullscreen(false);
	surface_resize(application_surface, global.standard_window_width, global.standard_window_height);
	alarm[1] = 1;
}