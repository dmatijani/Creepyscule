///@desc Opens the high scores on the main menu

if (instance_exists(main_menu)) with (main_menu) {
	which_menu = 1;
	fade_alpha = 0;
}

instance_destroy(); //Destroys itself