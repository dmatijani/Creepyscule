///@desc Gets damaged (with knockback)

if (invincible_countdown > 0) exit;

if (z > (other.z - other.height) && (z - height) < other.z) {
	var _owner = other.owner;
	if (instance_exists(_owner)) {
		if (_owner == id) exit; //Doesn't get hurt by itself
	}
	
	if (other.damage_id != invincible_to) { //If the enemy was not hurt by this instance
		life -= other.damage;
		invincible_to = other.damage_id;
		
		invincible_countdown = 50;
		
		//Takes knockback
		var _kb_val = other.knockback;
		if (_kb_val > 0) {
			var _owner = other.owner;
			if (instance_exists(_owner)) {
				var _kb_x = _owner.x;
				var _kb_y = _owner.y;
			} else {
				var _kb_x = 0;
				var _kb_y = 0;
			}
				
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
		instance_create_layer(x, y - 20, "Instances", obj_blood_particle);
		
		//Dies
		if (life <= 0) {
			event_user(15); //Death event
			audio_play_sound(snd_player_die, 10, false);
		} else {
			audio_play_sound(snd_player_hit, 10, false);
		}
	}
}