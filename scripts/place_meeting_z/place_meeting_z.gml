///@desc place_meeting_z
///@arg x
///@arg y
///@arg z
///@arg obj
///@arg zfloor

function place_meeting_z (_x, _y, _z, _obj, _zfl = 0) {
	var _meeting = place_meeting(_x, _y, _obj);
	var _obj_list = ds_list_create();
	var _obj_num = instance_place_list(_x, _y, _obj, _obj_list, false);
	
	var _zm = false;
	for (var i = 0; i < _obj_num; i ++) {
		var _obj_at = _obj_list[| i];
		if (_obj_at != noone) { //Checks if the player is in the z part of the bounding box
			var _oz = _obj_at.z;
			var _oh = _obj_at.height;
			var _zm = (_z > (_oz - _oh)) && ((_z - height) < _oz);
			if (_zm) break;
		}
	}
	
	ds_list_destroy(_obj_list);
	
	if (_z > _zfl) return true;
	else return _meeting && _zm;
}