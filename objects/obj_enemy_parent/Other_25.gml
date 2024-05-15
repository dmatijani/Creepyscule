///@desc Dying

instance_create_layer(x, y - 24, layer, obj_smoke);

if (instance_exists(level_ctrl)) {
	level_ctrl.scr += worth; //Adds the score to the level controller
	level_ctrl.score_countdown = 1;
	
	level_ctrl.wave_progress += progress_worth; //Increments the wave progress
}

instance_destroy();