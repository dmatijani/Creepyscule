///@desc Gets damaged (with knockback)

if (z > (other.z - other.height) && (z - height) < other.z) {
	var _owner = other.owner;
	if (instance_exists(_owner)) {
		if (_owner == id) exit; //Doesn't get hurt by itself
		if (_owner.is_enemy) exit; //Does not get hurt by fellow enemies
	}
	
	if (other.damage_id != invincible_to) { //If the enemy was not hurt by this instance
		life -= other.damage;
		invincible_to = other.damage_id;
		
		invincible_countdown = 50;
		
		//Takes knockback
		var _kb_val = other.knockback;
		if (_kb_val > 0) {
			if (other.owner == obj_player.id) {
				var _kb_x = obj_player.x;
				var _kb_y = obj_player.y;
				
				var _kb_angle = point_direction(_kb_x, _kb_y, x, y);
				
				hsp += round_n(lengthdir_x(_kb_val, _kb_angle), acc);
				vsp += round_n(lengthdir_y(_kb_val, _kb_angle), acc);
			}
		}
		
		audio_play_sound(snd_hit, 10, false); //Plays the standard hit sound
		
		//Creates the blood effect
		instance_create_layer(x, y - 24, "Instances", obj_blood_particle);
		
		//Dies
		if (life <= 0) {
			event_user(15); //Death event
			audio_play_sound(snd_zombie_death, 10, false); //Plays the death sound
		} else {
			audio_play_sound(choose(snd_zombie_hurt_1, snd_zombie_hurt_2), 10, false);
		}
	}
}