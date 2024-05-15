///@desc Manipulating the camera

var _cw = std_width*zoom;
var _ch = std_height*zoom;
camera_set_view_size(cam, _cw, _ch);

if (instance_exists(obj_player)) {
	xfollow = obj_player.x - _cw/2;
	yfollow = (obj_player.y - obj_player.sprite_height/2 + obj_player.z) - _ch/2;
	
	xfollow = clamp(xfollow, 0, room_width - _cw);
	yfollow = clamp(yfollow, 0, room_height - _ch);
	
	camera_set_view_pos(cam, xfollow, yfollow);
}