///@desc Gets damaged

var _owner = other.owner;
if (instance_exists(_owner)) {
	if (_owner == id) exit; //Doesn't get hurt by itself
	if (_owner.is_enemy) exit; //Does not get hurt by fellow enemies
}

if (z > (other.z - other.height) && (z - height) < other.z) {
	if (other.damage_id != invincible_to) { //If the enemy was not hurt by this instance
		life -= other.damage;
		invincible_to = other.damage_id;
		
		invincible_countdown = 50;
		
		//Dies
		if (life <= 0) {
			event_user(15); //Death event
		}
	}
}