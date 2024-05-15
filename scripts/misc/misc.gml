///@desc Miscellaneous scripts

//Approach function
function approach (_x, _y, _am) {
	//Approaches x to y by am
	if (_y < _x) _x -= _am;
	else
	if (_y > _x) _x += _am;
	
	return _x;
}

//Rounds to N
function round_n (_n, _r = 1) {
	//Rounds n to r
	return round(_n/_r)*_r;
}

//Mapping random numbers
function map_array_numbers (_numb, _space) {
	//Generates an array with random numbers from the first array
	var _arr_of_num = [];
	for (var i = 0; i < _numb; i ++) { //Creates an array with the indexes
		_arr_of_num[i] = i;
	}
	
	var _arr_of_ind = [];
	for (var j = 0; j < _space; j ++) { //Creates an array with the number of indexes that fit
		var _which_to_pop = irandom(_numb - 1);
		array_push(_arr_of_ind, _arr_of_num[_which_to_pop]);
		var _new_arr = [];
		for (var k = 0; k < _numb; k ++) {
			if (k != _which_to_pop) {
				array_push(_new_arr, _arr_of_num[k]);
			}
		}
		_numb --;
		_arr_of_num = _new_arr;
	}
	
	return _arr_of_ind;
}