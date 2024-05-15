///@desc draw_numb_format
///@arg number
///@arg length

function draw_numb_format(_num, _len) {
	var _str = string(_num);
	
	while (string_length(_str) < _len) {
		_str = "0" + _str;
	}
	
	return _str;
}