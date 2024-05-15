///@desc Option control

if (room == rm_menu) exit;

//Changing the options
if (!entering_hs) {
	if (keyboard_check_pressed(vk_left)) {
		option_selected --;
		if (option_selected == -1) option_selected = 1;
		audio_play_sound(snd_select, 10, false);
	}

	if (keyboard_check_pressed(vk_right)) {
		option_selected ++;
		if (option_selected == 2) option_selected = 0;
		audio_play_sound(snd_select, 10, false);
	}

	//Choosing the option
	if (keyboard_check_pressed(ord("A"))) { //Performs the button action
		first_screen_buttons[option_selected].press();
	}
} else { //If the player is entering his high score
	//Changing the keys
	if (keyboard_check_pressed(vk_left)) {
		key_selected --;
		if (key_selected < 0) key_selected = 9;
		
		key_selected = clamp(key_selected, 0, key_number);
		audio_play_sound(snd_select, 10, false);
	} else
	if (keyboard_check_pressed(vk_right)) {
		key_selected ++;
		if (key_selected == 38) key_selected = 29;
		
		key_selected = clamp(key_selected, 0, key_number);
		audio_play_sound(snd_select, 10, false);
	} else
	if (keyboard_check_pressed(vk_down)) {
		if ((key_selected >= 30) && (key_selected <= 37) || (key_selected == 29)) {
			key_selected = key_number;
		} else {
			if (key_selected == 29) {
				key_selected -= 2*keys_in_row;
			} else
			if (key_selected == 28) {
				key_selected = 37;
			} else {
				key_selected += keys_in_row;
			}
		}
		
		key_selected = clamp(key_selected, 0, key_number);
		audio_play_sound(snd_select, 10, false);
	} else
	if (keyboard_check_pressed(vk_up)) {
		if (key_selected == key_number) key_selected = 30;
		else {
			if (key_selected > 9) {
				key_selected -= keys_in_row;
			} else {
				if ((key_selected == 8) || (key_selected == 9)) {
					key_selected += 2*keys_in_row;
				} else {
					key_selected += 3*keys_in_row;
				}
			}
		}
		
		key_selected = clamp(key_selected, 0, key_number);
		audio_play_sound(snd_select, 10, false);
	}
	
	//Selecting the keys
	if (keyboard_check_pressed(ord("A"))) { //Adds or removes a letter in the name
		if (key_selected == 29) { //Changes the case
			key_case = !key_case;
		} else
		if (key_selected == 37) {
			if (string_length(player_name)) > 0 {
				player_name = string_copy(player_name, 1, string_length(player_name) - 1);
			}
		} else
		if (key_selected == key_number) { //Saves the high score table
			if (string_length(player_name) > 0) { //If the player typed in the name
				var _new_entry_index = ds_grid_height(global.high_scores);
				//Resizes the grid
				ds_grid_resize(global.high_scores, 4, _new_entry_index + 1);
			
				//Adds the new entry
				global.high_scores[# 0, _new_entry_index] = player_name;
				global.high_scores[# 1, _new_entry_index] = score_copied;
				global.high_scores[# 2, _new_entry_index] = draw_numb_format(current_year, 4) + "/" + draw_numb_format(current_month, 2) + "/" + draw_numb_format(current_day, 2);
			
				//Resets all item placing
				for (var i = 0; i < _new_entry_index; i ++) {
					global.high_scores[# 3, i] = 0;
				}
			
				//Sorts the DS map by the high score
				ds_grid_sort(global.high_scores, 1, false);

				//Gives the high scores to the highest people
				for (var i = 0; i < min(3, ds_grid_height(global.high_scores)); i ++) {
					global.high_scores[# 3, i] = i + 1;
				}
			
				//Goes to the main menu room
				room_goto(rm_menu);
				alarm[1] = 2;
			}
		} else {
			var _key_to_add = string_char_at(key_string, key_selected + 1);
			if (!key_case) _key_to_add = string_lower(_key_to_add);
			
			player_name = player_name + _key_to_add;
			player_name = string_copy(player_name, 1, min(string_length(player_name), max_name_len));
		}
	} else
	if (keyboard_check_pressed(vk_space)) { //Adds a space in the name
		player_name = player_name + " ";
		player_name = string_copy(player_name, 1, min(string_length(player_name), max_name_len));
	}
}