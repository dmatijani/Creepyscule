///@desc Init

event_inherited();

//Veriticality
z = 0;
height = 36;

//Movement
max_spd = 0.8; //Does not change
acc = 0.05; //Does not change
jump_spd = 5.8; //Does not change
grav = 0.3; //Does not change

hsp = 0;
vsp = 0;
zsp = 0;

facing = 1; //Which way is the player facing? (1 for right, -1 for left)

//Contact damage
contact_damage = 2;
contact_kb = 5;

kb_resist = 0.6; //Resistance to knockback

//Item usage
is_swinging = false;
swing_prog = -1;
my_damage = noone;
no_swing_timer = irandom_range(60, 100); //Cannot swing the sword when this timer is active

item = -1; //-1 for no item

//Random movement
poi_x = x;
poi_y = y;
jumping = false;

//Pathfinding grids
var _tile_size = 40;
pf_grid_floor = mp_grid_create(0, 0, room_width/_tile_size, room_height/_tile_size, _tile_size, _tile_size);
pf_grid_top = mp_grid_create(0, 0, room_width/_tile_size, room_height/_tile_size, _tile_size, _tile_size);
pf_path_floor = path_add();
pf_path_top = path_add();

alarm[2] = 2; //Adds the solids to the grid
can_move = false;
randomly_move = false;
alarm[1] = irandom_range(30, 60); //Randomly changes the direction

//Sets the knight item to a sword
item = {
	damage : 4,
	swing_time : 20,
	size : 1.2,
	knockback : 3,
	sprite : spr_standard_sword,
	swing_color : c_white
};

//Score
worth = 30;