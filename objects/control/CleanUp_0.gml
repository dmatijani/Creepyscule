///@desc Deletes the fonts and the permanent stuff

//Saves the game to a file
if (ds_grid_height(global.high_scores) > 0) {
	hs_file = "Highscores.hs";
	
	//Resets all item placing
	for (var i = 0; i < ds_grid_height(global.high_scores); i ++) {
		global.high_scores[# 3, i] = 0;
	}
	
	//Saves the grid
	var _save_string = ds_grid_write(global.high_scores);
	if (file_exists(hs_file)) file_delete(hs_file);
	ini_open(hs_file);
	ini_write_string("save", "save1", _save_string);
	ini_close();
}

//Deletes the fonts
font_delete(global.main_font);
font_delete(global.main_font_outline);
font_delete(global.small_font);
font_delete(global.small_font_outline);

//Deletes the grid
if (ds_exists(global.high_scores, ds_type_grid)) ds_grid_destroy(global.high_scores);