///@desc Draws shadows for everyone

//Variables
cx = camera.xfollow;
cy = camera.yfollow;

//Creates the surface again if it is missing
if (!surface_exists(shadow_surface)) {
	shadow_surface = surface_create(camera.std_width*camera.zoom, camera.std_height*camera.zoom + 160);
}

//Draws the shadows to the surface
surface_set_target(shadow_surface);

draw_clear_alpha(c_white, 0);

var _cx = cx;
var _cy = cy;
with (obj_game_object) {
	if (!floor_object) {
		draw_sprite_stretched_ext(spr_shadow, 0, bbox_left - _cx, bbox_top - _cy, bbox_right - bbox_left, bbox_bottom - bbox_top, c_white, 1);
	}
}

surface_reset_target();