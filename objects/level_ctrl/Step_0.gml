///@desc Wave logic

if (timer > 0) {
	timer --; //Lowers the timer every frame
	if (night_state == 1) {
		night = (morning_and_evening_time - timer)/morning_and_evening_time;
	} else
	if (night_state == 3) {
		night = timer/morning_and_evening_time;
	}
} else
if (timer == 0) {
	if (night_state == 0) { //Switches from day to evening
		timer = morning_and_evening_time; //Ten seconds
		night_state = 1;
	} else
	if (night_state == 1) { //Switches from evening to night
		timer = -1; //Makes the night endless
		night_state = 2;
		night = 1;
		if (help_text == 1) help_text = 2;
		alarm[0] = 150;
		
		audio_play_sound(snd_night, 10, false);
		
		event_user(0); //Creates the night enemies
	} else
	if (night_state == 3) { //Switches from morning to day
		timer = day_time;
		night_state = 0;
		night = 0;
	}
} else
if (timer == -1) { //If the timer is turned off
	//Progressing through the wave
	if (wave_progress >= wave_prog_max) { //If the wave progress is reached
		//Creates the new batch of enemies or progresses the night
		var _night_is_done = init_wave_enemies(current_night, enemy_iter, max_enemy_iter);
		if (!_night_is_done) {
			event_user(0);
		} else { //Progresses the night
			timer = morning_and_evening_time;
			night_state = 3; //Switches from night to morning
			if ((help_text == 2) || (help_text == 3)) {
				help_text = 4;
				alarm[0] = 180;
			}
			
			if (audio_is_playing(snd_night)) audio_stop_sound(snd_night);
			audio_play_sound(snd_day, 10, false);
			
			current_night ++;
			wave_progress = -1;
			enemy_iter = 1;
			
			init_wave_enemies(current_night, enemy_iter, max_enemy_iter);
		}
	}
}