///@desc Init

event_inherited();

//Veriticality
z = 0;
height = 36;

//Movement
max_spd = 3.5; //Does not change
acc = 0.5; //Does not change
jump_spd = 6.2; //Does not change
grav = 0.3; //Does not change

hsp = 0;
vsp = 0;
zsp = 0;

facing = 1; //Which way is the player facing? (1 for right, -1 for left)

//Life and stuff
life = 30;
max_life = life;
invincible_countdown = 0;
invincible_to = 0; //The ID of the instance

//Item usage
is_swinging = false;
swing_prog = -1;
my_damage = noone;

item = -1; //-1 for no item

is_enemy = false;