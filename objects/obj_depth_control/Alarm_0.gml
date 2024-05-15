///@desc Resizes the surface

if (surface_exists(shadow_surface)) {
	surface_resize(shadow_surface, camera.std_width*camera.zoom, camera.std_height*camera.zoom + 160);
}