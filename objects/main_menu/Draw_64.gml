///@desc Drawing the main menu

//Variables
var _scl = (window_get_width()/global.standard_window_width)*global.gui_scale;
var _ww = window_get_width();
var _wh = window_get_height();
var _title_x = _ww/2;
var _title_y = 6*_scl;

if (which_menu == 0) { //Drawing the standard main menu
	//Drawing the logo
	draw_sprite_ext(spr_game_logo, 0, _title_x, _title_y, _scl, _scl, 0, c_white, 1);

	//Drawing the options
	var _ox = _ww/2; //Option X
	var _oy = _wh/2 + 20*_scl; //Option Y
	var _opt_sep = 25; //The option separation
	var _sel_offset = 4;

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.main_font_outline);

	for (var i = 0; i < num_of_options; i ++) {
		var _selected = (i == which_option);
		if (_selected) {
			draw_set_color(c_yellow);
			draw_sprite_ext(spr_menu_arrow, (current_time/100) mod 4, _ox - (string_width(option_array[i].text)/2)*_scl, _oy - 3*_scl, _scl, _scl, 0, c_white, 1);
		}
	
		draw_text_transformed(_ox + _selected*_sel_offset*_scl, _oy, option_array[i].text, _scl, _scl, 0);
	
		_oy += _opt_sep*_scl;
		draw_set_color(c_white);
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
} else
if (which_menu == 1) { //Drawing the high scores tab
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.main_font_outline);
	
	var _scroll_bar_width = 10;
	var _scroll_bar_height = 20;
	var _hs_text_y = 32;
	var _hs_boxes_w = 240;
	var _hs_boxes_h = 20;
	var _hs_boxes_x = _ww/2 - (_hs_boxes_w/2 + 0.5*_scroll_bar_width*(hs_box_number > hs_box_max))*_scl;
	var _hs_boxes_y = 60;
	var _button_sep = 150;
	var _options_and_button_sep = 24;
	var _sel_offset = 4;
	
	//Drawing the high score text
	draw_text_transformed(_ww/2, _hs_text_y*_scl, "HIGH SCORES", _scl*2, _scl*2, 0);
	
	if (hs_box_number > 0) { //If there are high scores
		//Drawing the high score boxes
		draw_set_halign(fa_left);
		draw_set_font(global.small_font_outline);
		for (var i = 0; i < min(hs_box_number, hs_box_max); i ++) {
			var _hs_index = i + hs_box_offset;
		
			draw_sprite_ext(spr_score_box, global.high_scores[# 3, _hs_index], _hs_boxes_x, (_hs_boxes_y + i*_hs_boxes_h)*_scl, _scl, _scl, 0, c_white, 1);
		
			draw_text_transformed(_hs_boxes_x + 10*_scl, (_hs_boxes_y + (i + 0.6)*_hs_boxes_h)*_scl, global.high_scores[# 0, _hs_index], _scl, _scl, 0);
			draw_set_halign(fa_center);
			draw_text_transformed(_hs_boxes_x + (_hs_boxes_w/2)*_scl, (_hs_boxes_y + (i + 0.6)*_hs_boxes_h)*_scl, "Score: " + string(global.high_scores[# 1, _hs_index]), _scl, _scl, 0);
			draw_set_halign(fa_right);
			var _date = global.high_scores[# 2, _hs_index];
			draw_text_transformed(_hs_boxes_x + (_hs_boxes_w - 10)*_scl, (_hs_boxes_y + (i + 0.6)*_hs_boxes_h)*_scl, _date, _scl, _scl, 0);
			draw_set_halign(fa_left);
		}
		draw_set_halign(fa_center);
	
		//Drawing the slider
		if (hs_box_number > hs_box_max) {
			var _slider_x = _hs_boxes_x + _hs_boxes_w*_scl;
			var _slider_y = lerp(_hs_boxes_y*_scl, (_hs_boxes_y + 4*_hs_boxes_h - _scroll_bar_height)*_scl, hs_box_offset/(hs_box_number - hs_box_max));
			draw_sprite_ext(spr_scroll_bar, 1, _slider_x, _hs_boxes_y*_scl, _scl, _scl, 0, c_white, 1);
			draw_sprite_ext(spr_scroll_bar, 0, _slider_x, _slider_y, _scl, _scl, 0, c_white, 1);
		}
	} else { //Drawing the "No highscores" text
		draw_set_color(c_yellow);
		draw_text_transformed(_ww/2, _wh/2, "No plays yet!", _scl, _scl, 0);
		draw_set_color(c_white);
	}
	
	//Drawing the options
	draw_set_font(global.main_font_outline);
	for (var i = 0; i < 2; i ++) {
		var _selected = (i == which_option_hs);
		var _ox = _ww/2 + (-0.5 + i)*_scl*_button_sep;
		var _oy = (_hs_boxes_y + 4*_hs_boxes_h + _options_and_button_sep)*_scl;
		
		var _option_txt = option_array_hs[i].text;
		if (i == 0) {
			_option_txt += sort_by_names[sort_by];
		}
		
		if (_selected) {
			draw_set_color(c_yellow);
			draw_sprite_ext(spr_menu_arrow, (current_time/100) mod 4, _ox - (string_width(_option_txt)/2)*_scl, _oy - 3*_scl, _scl, _scl, 0, c_white, 1);
		}
		
		draw_text_transformed(_ox + _selected*_sel_offset*_scl, _oy, _option_txt, _scl, _scl, 0);
		draw_set_color(c_white);
	}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

//Drawing the black fade
if (fade_alpha > 0) {
	draw_sprite_ext(spr_pixel, 0, -100, -100, _ww + 200, _wh + 200, 0, c_black, fade_alpha);
	
	fade_alpha -= 1/fade_time;
} else {
	fade_alpha = 0;
}