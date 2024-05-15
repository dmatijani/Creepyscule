///@desc Takes a screenshot of the game

//Image fade
fade_lerp = 0;

//Creates the death surface
if window_has_focus() {
	death_surface = surface_create(window_get_width(), window_get_height());
	surface_copy(death_surface, 0, 0, application_surface);
	surface_save(death_surface, "Death.png");
} else death_surface = 0;

alarm[0] = 2; //Goes to the DEATH ROOM (this sounds so metal)

//Copied variables
score_copied = level_ctrl.scr;
nights_copied = level_ctrl.current_night;

//Which menu
entering_hs = false; //Is the player going to enter his high score?

//The buttons
option_selected = 0;
first_screen_buttons = [
	{
		text : "Enter score",
		press : function() {
			with (death) entering_hs = true;
			
			audio_play_sound(snd_select, 10, false);
		}
	},
	{
		text : "Main menu",
		press : function() {
			room_goto(rm_menu);
			
			audio_play_sound(snd_select, 10, false);
			
			with (death) instance_destroy();
		}
	}
];

//Keys
key_selected = 0;
key_string = "1234567890QWERTZUIOPASDFGHJKL.YXCVBNM,";
keys_in_row = 10; //How many keys in a row
player_name = ""; //The player name
max_name_len = 10;
key_case = true; //Are the letters in all caps
key_number = string_length(key_string);