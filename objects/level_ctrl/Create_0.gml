///@desc Level init

scr = 0; //The current score

//GUI effects and scaling
score_countdown = 0;
countdown_time = 25;
hurt_countdown = 0;

//Time variables
morning_and_evening_time = 60*4;
day_time = 60*3;

//Enemies and waves
spawn_platforms = []; //The array containing all the spawn platforms
night = 0; //Night percentage
current_night = 1; //The current night
timer = -1; //Counts down to 0, -1 for inactive
night_state = 0; //0 - day, 1 - evening, 2 - night, 3 - morning
wave_progress = -1; //The wave progress, from 0 to wave_prog_max, -1 for inactive
wave_prog_max = 999; //How much the wave can progress
enemy_iter = 1; //Which iteration of enemies
max_enemy_iter = 1; //The max number of enemy iterations

init_wave_enemies(current_night, enemy_iter, max_enemy_iter);

//Help text
help_text = 0; //-1 for nothing
help_text_array = [
	"Pick up the sword!",
	"Now wait for the night.",
	"Here they come!",
	"",
	"Good job! Wait for the next night!"
];

//Night surface
with camera {
	var _surf_w = std_width*zoom;
	var _surf_h = std_height*zoom;
}

night_color = #003366;
night_color = #FFFFFF - night_color;
evening_color = #FF6633;
evening_color = #FFFFFF - evening_color;

night_surface = surface_create(_surf_w, _surf_h);

//Black fade
fade_time = 80;
fade_alpha = 1;

//Plays the day sound
audio_play_sound(snd_day, 10, false);