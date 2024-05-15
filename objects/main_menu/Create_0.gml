///@desc Menu init

//Menu options
which_menu = 0; //0 for the main menu, 1 for the high scores menu

option_array = [
	{
		text : "NEW GAME",
		press : function() {
			room_goto(rm_level);
		}
	},
	{
		text : "HIGH SCORES",
		press : function() {
			with (main_menu) which_menu = 1;
		}
	}
];

option_array_hs = [
	{
		text : "SORT BY: ",
		press : function() {
			with (main_menu) {
				sort_by ++;
				if (sort_by > 2) sort_by = 0;
				
				if (sort_by == 0) {
					ds_grid_sort(global.high_scores, 1, false);
				} else
				if (sort_by == 1) {
					ds_grid_sort(global.high_scores, 0, true);
				} else
				if (sort_by == 2) {
					ds_grid_sort(global.high_scores, 2, false);
				}
			}
		}
	},
	{
		text : "MAIN MENU",
		press : function() {
			with (main_menu) which_menu = 0;
		}
	}
];

//High score boxes
hs_box_number = ds_grid_height(global.high_scores); //How many highscore boxes there are
hs_box_max = 4; //Max number of highscore boxes
hs_box_offset = 0; //The highscore box offset

fade_alpha = 1;
fade_time = 80;

sort_by = 0; //By what are the high scores sorted
sort_by_names = ["score", "name", "date"];

num_of_options = array_length(option_array); //The number of options
which_option = 0; //Which option is selected
which_option_hs = 1; //Which high score option is selected