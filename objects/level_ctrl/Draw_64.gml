///@desc Drawing the GUI

//Lowers the countdowns
if (hurt_countdown > 0) {
	hurt_countdown -= 1/countdown_time;
} else hurt_countdown = 0;

if (score_countdown > 0) {
	score_countdown -= 1/countdown_time;
} else score_countdown = 0;

//Some variables
var _scl = (window_get_width()/global.standard_window_width)*global.gui_scale;
var _ww = window_get_width();
var _wh = window_get_height();
var _prog_bar_width = 240;
var _prog_bar_height = 10;
var _prog_bar_border = 2;
var _prog_bar_x = _ww/2 - (_prog_bar_width*_scl)/2;
var _prog_bar_y = 5*_scl;

//Drawing the progress bar
draw_sprite_ext(spr_progress_bar, 3, _prog_bar_x, _prog_bar_y, _prog_bar_width*_scl, _scl, 0, c_white, 1); //Back of the progress bar
draw_sprite_ext(spr_progress_bar, 1, _prog_bar_x, _prog_bar_y, (_prog_bar_width - 1)*_scl, _scl, 0, c_white, 1); //Top and bottom border of the progress bar

//Drawing the day and night progress on the progress bar
if ((night_state != 2) &&  !((night_state == 0) && (timer == -1))) { //If it is not night
	var _time = (night_state == 1)*timer;
	if (night_state == 0) {
		_time = timer + morning_and_evening_time;
	} else if (night_state == 3) {
		_time = timer + morning_and_evening_time + day_time;
	}
	var _max_time = 2*morning_and_evening_time + day_time;
	var _time_perc = _time/_max_time;
	draw_sprite_ext(spr_progress_bar, 4, _prog_bar_x, _prog_bar_y, _prog_bar_width*_scl*_time_perc, _scl, 0, c_white, 1);
} else { //If it is night
	var _night_perc = ((enemy_iter - 2)/max_enemy_iter) + (wave_progress/wave_prog_max)/max_enemy_iter;
	draw_sprite_ext(spr_progress_bar, 5, _prog_bar_x, _prog_bar_y, _prog_bar_width*_scl*_night_perc, _scl, 0, c_white, 1);
	
	//Drawing the finished progress during the night
	var _finished_perc = ((enemy_iter - 2)/max_enemy_iter);
	draw_sprite_ext(spr_progress_bar, 6, _prog_bar_x, _prog_bar_y, _prog_bar_width*_scl*_finished_perc, _scl, 0, c_white, 1);
	
	//Drawing the separators
	if (max_enemy_iter != 1) {
		for (var i = 0; i < max_enemy_iter - 1; i ++) {
			var _sep_x = _prog_bar_x + (((_prog_bar_width)/max_enemy_iter)*(i + 1) - 0.5)*_scl;
			draw_sprite_ext(spr_progress_bar, 7, _sep_x, _prog_bar_y, _scl, _scl, 0, c_white, 1);
		}
	}
}

//Left and right borders
draw_sprite_ext(spr_progress_bar, 0, _prog_bar_x - _prog_bar_border*_scl, _prog_bar_y, _scl, _scl, 0, c_white, 1); //Left border
draw_sprite_ext(spr_progress_bar, 2, _prog_bar_x - _prog_bar_border*_scl + _prog_bar_width*_scl, _prog_bar_y, _scl, _scl, 0, c_white, 1); //Right border

//Drawing the health progress
var _hb_width = 170;
var _hb_buffer = 2;
var _hb_x = _ww/2 - (_hb_width/2 - _hb_buffer)*_scl;
var _hb_y = _prog_bar_y + (_prog_bar_height + _prog_bar_border)*_scl;
var _plr_health_perc;
with (obj_player) {_plr_health_perc = life/max_life};

draw_sprite_ext(spr_health_bar, 0, _hb_x, _hb_y, _scl, _scl, 0, c_white, 1);
draw_sprite_part_ext(spr_health_bar, 1, 2, 0, 2 + _hb_width*_plr_health_perc, 8, _hb_x + _hb_buffer*_scl, _hb_y, _scl, _scl, c_white, 1);
draw_sprite_part_ext(spr_health_bar, 2, 2, 0, 2 + _hb_width*_plr_health_perc, 8, _hb_x + _hb_buffer*_scl, _hb_y, _scl, _scl, c_white, hurt_countdown);

//Drawing the text on the progress bar
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (night_state != 2) { //If it is not night
	draw_set_font(global.main_font_outline);
	if (!((night_state == 0) && (timer == -1))) {
		var _time_sec = _time div 60 mod 60;
		var _time_min = _time div 3600;
		draw_text_transformed(_ww/2, _prog_bar_y + (_prog_bar_height + 4)*_scl/2, draw_numb_format(_time_min, 2) + ":" + draw_numb_format(_time_sec, 2), _scl, _scl, 0);
	}
} else {
	draw_set_font(global.small_font_outline);
	var _tx = _prog_bar_x + ((_prog_bar_width)/max_enemy_iter)*(enemy_iter - 1.5)*_scl;
	var _ty = _prog_bar_y + (_prog_bar_height/2 + 2)*_scl;
	var _prog_perc = wave_progress/wave_prog_max;
	var _prog_text = string(floor(_prog_perc*100)) + "%";
	draw_text_transformed(_tx, _ty, _prog_text, _scl, _scl, 0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Drawing the current night
draw_set_font(global.small_font_outline);
var _txt = "DAY";
if (night_state == 2) _txt = "NIGHT";
draw_text_transformed(4*_scl, 4*_scl, _txt, _scl, _scl, 0);
draw_set_font(global.main_font_outline);
draw_text_transformed(5*_scl, 14*_scl, current_night, _scl, _scl, 0);

//Drawing the score
draw_set_font(global.small_font_outline);
draw_set_halign(fa_right);
draw_text_transformed(_ww - 4*_scl, 10*_scl, "SCORE\n" + draw_numb_format(scr, 10), _scl, _scl, 0);
draw_set_halign(fa_left);

//Drawing the help text
if (help_text != -1) {
	draw_set_halign(fa_center);
	
	var _ht_x = _ww/2;
	var _ht_y = _wh - 12*_scl;
	if (help_text == 2) draw_set_color(c_red);
	draw_text_transformed(_ht_x, _ht_y, help_text_array[help_text], _scl, _scl, 0);
	draw_set_color(c_white);
	
	draw_set_halign(fa_left);
}

//Drawing the black fade
if (fade_alpha > 0) {
	draw_sprite_ext(spr_pixel, 0, -100, -100, _ww + 200, _wh + 200, 0, c_black, fade_alpha);
	
	fade_alpha -= 1/fade_time;
} else {
	fade_alpha = 0;
}