///@desc Drawing the last death and the text

//Some variables
var _ww = window_get_width();
var _wh = window_get_height();
var _scl = global.gui_scale*(_ww/global.standard_window_width);

draw_sprite_ext(spr_pixel, 0, 0, 0, _ww, _wh, 0, c_black, 1);

//Increases the fade lerp
fade_lerp += 1/100;

//Draws the game screen
if (surface_exists(death_surface)) {
	draw_surface_stretched_ext(death_surface, 0, 0, window_get_width(), window_get_height(), merge_color(c_white, #333333, min(fade_lerp, 1)), 1);
} else {
	var _image = "Death.png";
	if file_exists(_image) {
		death_surface = surface_create(_ww, _wh);
		
		surface_set_target(death_surface);
		
		var _new_sprite = sprite_add(_image, 1, false, false, 0, 0);
		draw_sprite_ext(spr_pixel, 0, 0, 0, _ww, _wh, 0, c_black, 1);
		draw_sprite_stretched(_new_sprite, 0, 0, 0, _ww, _wh);
		draw_sprite_ext(spr_pixel, 0, 0, 0, 1, 1, 0, c_black, 0.01);
		sprite_delete(_new_sprite);
		
		surface_reset_target();
	}
}

//Drawing the game text
var _first_text_y = 10;
var _second_text_y = 70;
var _text_sep = 25;
var _text_sep_options = 55;
var _button_sep = 150;
var _sel_offset = 4;

if (!entering_hs) { //If the player is NOT entering his high score
	draw_set_halign(fa_center);
	
	draw_set_font(global.main_font_outline);
	draw_text_transformed(_ww/2, _first_text_y*_scl, "YOU DIED!", _scl*3, _scl*3, 0);

	draw_text_transformed(_ww/2, _second_text_y*_scl, "Score: " + string(score_copied), _scl, _scl, 0);
	draw_text_transformed(_ww/2, (_second_text_y + _text_sep)*_scl, "Nights survived: " + string(nights_copied), _scl, _scl, 0);

	draw_set_valign(fa_middle);

	//Drawing the options
	for (var i = 0; i < 2; i ++) {
		var _selected = (i == option_selected);
		var _ox = _ww/2 + (-0.5 + i)*_scl*_button_sep;
		var _oy = (_second_text_y + _text_sep + _text_sep_options)*_scl;
		if (_selected) {
			draw_set_color(c_yellow);
			draw_sprite_ext(spr_menu_arrow, (current_time/100) mod 4, _ox - (string_width(first_screen_buttons[i].text)/2)*_scl, _oy - 3*_scl, _scl, _scl, 0, c_white, 1);
		}
		draw_text_transformed(_ox + _selected*_sel_offset*_scl, _oy, first_screen_buttons[i].text, _scl, _scl, 0);
		draw_set_color(c_white);
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
} else { //If the player is entering his high score
	var _key_x = 15;
	var _key_y = 35;
	var _key_size = 20;
	var _key_sep = 10;
	
	var _name_text_x = _ww/2;
	var _name_text_y = _key_y/2;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_transformed(_name_text_x, _name_text_y*_scl, "Enter your name: " + player_name, _scl, _scl, 0);
	
	//Drawing the keys
	draw_set_font(global.small_font_outline);
	for (var i = 0; i < key_number; i ++) {
		var _kx = _key_x + (_key_size + _key_sep)*(i mod keys_in_row);
		var _ky = _key_y + (_key_size + _key_sep)*(i div keys_in_row);
		
		var _my_symbol = string_char_at(key_string, i + 1);
		if (_my_symbol == ".") _my_symbol = "Case";
		else if (_my_symbol == ",") _my_symbol = "Bksp";
		else if (!key_case) _my_symbol = string_lower(_my_symbol);
		
		draw_sprite_ext(spr_key, 0 + (i == 29) + 2*(i == 37) + 3*(i == key_selected), _kx*_scl, _ky*_scl, _scl, _scl, 0, c_white, 1);
		draw_text_transformed(_kx*_scl + (_key_size*0.5 + (_key_size + _key_sep)*0.5*(_my_symbol == "Bksp"))*_scl, _ky*_scl + _key_size*0.5*_scl, _my_symbol, _scl*(1 - 0.5*(_my_symbol == "Case")), _scl*(1 - 0.5*(_my_symbol == "Case")), 0);
	}
	
	var _submit_y = _wh - _name_text_y*_scl;
	if (key_selected == key_number) draw_set_color(c_yellow);
	draw_set_font(global.main_font_outline);
	draw_text_transformed(_name_text_x, _submit_y, "Submit high score", _scl, _scl, 0);
	draw_set_color(c_white);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}