///@desc Menu button logic

//Changing the option
if (which_menu == 0) { //If the main menu is on the start main menu
	if (keyboard_check_pressed(vk_down)) {
		which_option ++;
		if (which_option >= num_of_options) which_option = 0;
	
		audio_play_sound(snd_select, 10, false);
	}

	if (keyboard_check_pressed(vk_up)) {
		which_option --;
		if (which_option < 0) which_option = num_of_options - 1;
	
		audio_play_sound(snd_select, 10, false);
	}

	//Choosing the buttons
	if (keyboard_check_pressed(ord("A"))) {
		option_array[which_option].press();
		
		audio_play_sound(snd_select, 10, false);
	}
} else
if (which_menu == 1) { //If the main menu is on the highscores tab
	if (keyboard_check_pressed(vk_left)) {
		which_option_hs --;
		if (which_option_hs < 0) which_option_hs = 1;
		
		audio_play_sound(snd_select, 10, false);
	}
	
	if (keyboard_check_pressed(vk_right)) {
		which_option_hs ++;
		if (which_option_hs > 1) which_option_hs = 0;
		
		audio_play_sound(snd_select, 10, false);
	}
	
	//Changing the indexes
	if (hs_box_number > hs_box_max) {
		if (keyboard_check_pressed(vk_up)) {
			if (hs_box_offset > 0) {
				if (keyboard_check(vk_space)) {
					hs_box_offset = 0;
				} else {
					hs_box_offset --;
				}
				audio_play_sound(snd_select, 10, false);
			}
		}
		
		if (keyboard_check_pressed(vk_down)) {
			if (hs_box_offset < (hs_box_number - hs_box_max)) {
				if (keyboard_check(vk_space)) {
					hs_box_offset = (hs_box_number - hs_box_max);
				} else {
					hs_box_offset ++;
				}
				audio_play_sound(snd_select, 10, false);
			}
		}
	}
	
	//Choosing the buttons
	if (keyboard_check_pressed(ord("A"))) {
		option_array_hs[which_option_hs].press();
		
		audio_play_sound(snd_select, 10, false);
	}
}