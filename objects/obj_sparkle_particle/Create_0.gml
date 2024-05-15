///@desc Sets up the effect

blood_particle = part_type_create();
blood_system = part_system_create();

part_type_sprite(blood_particle, spr_pixel, false, false, false);
part_type_scale(blood_particle, 1.95, 2.05);
part_type_alpha3(blood_particle, 1, 0.95, 0.55);
part_type_speed(blood_particle, 0.38, 1.51, 0, 0);
part_type_direction(blood_particle, 0, 359.99, 0, 0);
part_type_gravity(blood_particle, 0.06, 270);
part_type_orientation(blood_particle, 0, 0, 0, 0, 0);
part_type_blend(blood_particle, 0);
part_type_life(blood_particle, 24, 42);
part_type_color1(blood_particle, make_color_rgb(248, 169, 67));

part_particles_create(blood_system, x, y, blood_particle, irandom_range(27, 35));

alarm[0] = 43; //Self destruction alarm