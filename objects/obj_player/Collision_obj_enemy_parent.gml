///@desc Gets damaged (with knockback)

if (invincible_countdown > 0) exit;

if (z > (other.z - other.height) && (z - height) < other.z) {
	var _contact_dmg = other.contact_damage;
	if (_contact_dmg > 0) {
		life -= _contact_dmg;
		
		invincible_countdown = 50;
		
		//Takes knockback
		var _kb_val = other.contact_kb;
		if (_kb_val > 0) {
			var _kb_x = other.x;
			var _kb_y = other.y;
				
			var _kb_angle = point_direction(_kb_x, _kb_y, x, y);
				
			hsp += round_n(lengthdir_x(_kb_val, _kb_angle), acc);
			vsp += round_n(lengthdir_y(_kb_val, _kb_angle), acc);
		}
		
		//Changes the hurt countdown
		if (instance_exists(level_ctrl)) {
			with (level_ctrl) hurt_countdown = 1;
		}
		
		//Plays the hurt sounds
		audio_play_sound(snd_hit, 10, false);
		
		//Creates the blood effect
		instance_create_layer(x, y - 24, "Instances", obj_blood_particle);
		
		//Dies
		if (life <= 0) {
			event_user(15); //Death event
			audio_play_sound(snd_player_die, 10, false);
		} else {
			audio_play_sound(snd_player_hit, 10, false);
		}
	}
}