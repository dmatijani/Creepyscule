///@desc Deletes the surface

if (surface_exists(night_surface)) surface_free(night_surface);

if (audio_is_playing(snd_day)) audio_stop_sound(snd_day);
if (audio_is_playing(snd_night)) audio_stop_sound(snd_night);