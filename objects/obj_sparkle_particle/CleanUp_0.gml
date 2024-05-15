///@desc Destroys the particles

if part_system_exists(blood_system) then part_system_destroy(blood_system);
if part_type_exists(blood_particle) then part_type_destroy(blood_particle);