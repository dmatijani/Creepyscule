///@desc Init wave enemies
function init_wave_enemies(wave, iter, max_iter) {
	enemy_array = []; //The array with enemies
	
	if (wave mod 5 == 0) { //Creates the knight on every fifth wave
		var _knight = {
			obj_index : obj_knight,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}

		for (var i = 0; i < min(iter, 4); i ++) { //Fills up the enemy array
			enemy_array[i] = _knight;
		}
		max_enemy_iter = min(min(wave div 5, 4), 10);
		
		delete _knight;
	} else
	if (wave mod 5 == 1) { //Creates the skeleton
		var _skeleton = {
			obj_index : obj_skeleton,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}

		for (var i = 0; i < min(iter + (wave > 2), 4); i ++) { //Fills up the enemy array
			enemy_array[i] = _skeleton;
		}
		max_enemy_iter = min(min(wave div 5, 4), 10);
		
		delete _skeleton;
	} else
	if (wave mod 5 == 2) { //Creates the zombie
		var _zombie = {
			obj_index : obj_zombie,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}

		for (var i = 0; i < min(iter + 1 + (wave > 2), 4); i ++) { //Fills up the enemy array
			enemy_array[i] = _zombie;
		}
		max_enemy_iter = min(min(wave div 5, 4), 10);
		
		delete _zombie;
	} else
	if (wave mod 5 == 3) { //Creates the zombie and skeleton
		var _skeleton = {
			obj_index : obj_skeleton,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}
		
		var _zombie = {
			obj_index : obj_zombie,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}

		for (var i = 0; i < min(iter + 2, 4); i ++) { //Fills up the enemy array
			enemy_array[i] = choose(_zombie, _zombie, _skeleton);
		}
		max_enemy_iter = min(min(wave div 5, 4), 10);
		
		delete _skeleton;
		delete _zombie;
	} else
	if (wave mod 5 == 4) { //Creates the alien, zombie or skeleton
		var _skeleton = {
			obj_index : obj_skeleton,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}
		
		var _zombie = {
			obj_index : obj_zombie,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}
		
		var _alien = {
			obj_index : obj_alien,
			life : -1, //-1 for unchanged
			cnt_damage : -1 //-1 for unchanged
		}

		for (var i = 0; i < min(iter + 2, 4); i ++) { //Fills up the enemy array
			enemy_array[i] = choose(_zombie, _skeleton);
			if (wave > 8) {
				enemy_array[i] = choose(_zombie, _skeleton, _alien);
				if (wave > 20) {
					enemy_array[i] = choose(_zombie, _skeleton, _skeleton, _alien, _alien, _alien);
				}
			}
		}
		max_enemy_iter = min(min(wave div 5, 4), 10);
		
		delete _skeleton;
		delete _zombie;
		delete _alien;
	}
	
	
	/*{
		switch (wave) {
			case 1: {
				var _skeleton = {
					obj_index : obj_skeleton,
					life : -1, //-1 for unchanged
					cnt_damage : -1 //-1 for unchanged
				}

				for (var i = 0; i < iter; i ++) { //Fills up the enemy array
					enemy_array[i] = _skeleton;
				}
				max_enemy_iter = 2;
			}; break;
			case 6: {
				var _alien = {
					obj_index : obj_alien,
					life : -1, //-1 for unchanged
					cnt_damage : -1 //-1 for unchanged
				}

				for (var i = 0; i < 2; i ++) { //Fills up the enemy array
					enemy_array[i] = _alien;
				}
				max_enemy_iter = 1;
			}; break;
			default: {
				var _zombie = {
					obj_index : obj_zombie,
					life : -1, //-1 for unchanged
					cnt_damage : -1 //-1 for unchanged
				}

				for (var i = 0; i < iter + 1; i ++) { //Fills up the enemy array
					enemy_array[i] = _zombie;
				}
				max_enemy_iter = 2;
			}; break;
		}
	}*/
	
	enemy_iter ++; //Another enemy wave for the night
	
	if (iter > max_iter) return true;
	else return false;
}