///@desc Init

event_inherited();

//Veriticality
z = 0;
height = 36;

//Movement
max_spd = 1.6; //Does not change
acc = 0.15; //Does not change
jump_spd = 5.9; //Does not change
grav = 0.3; //Does not change

hsp = 0;
vsp = 0;
zsp = 0;

facing = 1; //Which way is the player facing? (1 for right, -1 for left)

//Contact damage
contact_damage = 3;
contact_kb = 4;

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

//Health
life = 8;
max_life = life;

//Score
worth = 35;