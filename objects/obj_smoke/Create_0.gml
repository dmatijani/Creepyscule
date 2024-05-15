///@desc Initializes the particles and sets up the alarm

//Creates the system
puff_system = part_system_create();
puff_particle = part_type_create();

//Makes the particle
part_type_sprite(puff_particle, spr_smoke, 1, 1, 0);
part_type_size(puff_particle, 0.9, 1.1, 0, 0);
part_type_scale(puff_particle, 2, 2);
part_type_speed(puff_particle, 0.30, 0.60, 0, 0);
part_type_direction(puff_particle, 0, 359, 0, 0);
part_type_orientation(puff_particle, 0, 359, 0, 0, 1);
part_type_blend(puff_particle, 0);
part_type_life(puff_particle, 25, 50);

//Creates the particles
part_particles_create(puff_system, x, y, puff_particle, choose(10, 11));

//Sets the destruction alarm
alarm[0] = 55;