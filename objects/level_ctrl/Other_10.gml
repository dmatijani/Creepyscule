///@desc Creates the night enemies

wave_progress = 0;
wave_prog_max = 0;
		
//Summons the enemies
var _number_of_platforms = array_length(spawn_platforms);
var _number_of_enemies = array_length(enemy_array);
var _platform_array = map_array_numbers(_number_of_platforms, _number_of_enemies);
for (var i = 0; i < _number_of_enemies; i ++) { //Summons an enemy on every platform
	var _platform_index = _platform_array[i];
	var _plat = spawn_platforms[_platform_index];
	var _sx = _plat.x + 20;
	var _sy = _plat.y + 12;
	var _which_enemy = enemy_array[i];
	var _enemy_id = _which_enemy.obj_index;
	with (instance_create_layer(_sx, _sy, "Instances", _enemy_id)) {
		if (_which_enemy.life != -1) {
			life = _which_enemy.life;
			max_life = life;
		}
		if (_which_enemy.cnt_damage != -1) {
			contact_damage = _which_enemy.cnt_damage;
		}
				
		//Adds the wave value to the progress max
		level_ctrl.wave_prog_max += progress_worth;
	}
	
	instance_create_layer(_sx, _sy, "Instances", obj_smoke);
}