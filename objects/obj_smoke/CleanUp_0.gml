///@desc Destroys the systems

if part_system_exists(puff_system) then part_system_destroy(puff_system);
if part_type_exists(puff_particle) then part_type_destroy(puff_particle);