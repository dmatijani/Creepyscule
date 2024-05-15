///@desc Has a chance to give the player a heart

event_inherited();

if (obj_player.life < 10) {
	var _chance = (choose(0, irandom(obj_player.life)) == 1);
	if (_chance) instance_create_layer(x, y, layer, obj_health_item);
}