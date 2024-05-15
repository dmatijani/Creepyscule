///@desc Game init

//Randomizes the game
randomize();

//Global variables and window resizing
global.standard_window_width = 1280;
global.standard_window_height = 720;
global.gui_scale = 4;
window_set_size(global.standard_window_width, global.standard_window_height);

//Adds the font
global.main_font = font_add_sprite(spr_main_font, 32, true, 2);
global.main_font_outline = font_add_sprite(spr_main_font_outline, 32, true, 0);
global.small_font = font_add_sprite(spr_small_font, 32, true, 2);
global.small_font_outline = font_add_sprite(spr_small_font_outline, 32, true, 0);

//Highscores
//MAP: name, high score, date, index
global.high_scores = ds_grid_create(4, 0);

alarm[0] = 1; //Goes to the next room
alarm[2] = 3; //Resizes the window
alarm[3] = 3; //Fills up the DS grid with high scores