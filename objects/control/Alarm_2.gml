///@desc Resizes the application surface

if (window_get_fullscreen()) {
	surface_resize(application_surface, display_get_width(), display_get_height());
} else {
	surface_resize(application_surface, global.standard_window_width, global.standard_window_height);
}