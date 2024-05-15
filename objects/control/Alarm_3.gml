///@desc Fills up the DS grid with high scores

hs_file = "Highscores.hs";
if (file_exists(hs_file)) {
	show_debug_message("The height before is " + string(ds_grid_height(global.high_scores)));
	
	var _save_str = "";
	ini_open(hs_file);
	var _save_str = ini_read_string("save", "save1", "error");
	ini_close();
	
	ds_grid_read(global.high_scores, _save_str);
	
	show_debug_message("The height after is " + string(ds_grid_height(global.high_scores)));
	
	//Resets all item placing
	for (var i = 0; i < ds_grid_height(global.high_scores); i ++) {
		global.high_scores[# 3, i] = 0;
		show_debug_message("Went through this loop!");
	}
	
	//Sorts the DS map by the high score
	ds_grid_sort(global.high_scores, 1, false);

	//Gives the high scores to the highest people
	for (var i = 0; i < min(3, ds_grid_height(global.high_scores)); i ++) {
		global.high_scores[# 3, i] = i + 1;
	}

	//Gives the main menu the correct variables
	if (instance_exists(main_menu)) {
		with (main_menu) hs_box_number = ds_grid_height(global.high_scores);
	}
}