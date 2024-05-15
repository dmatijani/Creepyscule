///@desc Standard enemy stuff

event_inherited();

max_life = 20;
life = max_life;

invincible_to = 0; //The ID of the damage object the enemy was last hurt by
invincible_countdown = 0; //The red colored countdown

contact_damage = 0; //Damage on contact
contact_kb = 0; //Knockback on contact

worth = 5; //How much score is the enemy
progress_worth = 1; //How much progress does the enemy bring to the table

is_enemy = true;