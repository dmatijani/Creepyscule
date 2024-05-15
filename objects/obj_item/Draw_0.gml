///@desc Drawing self

var _spr_w = sprite_get_width(sprite_index);

draw_sprite_stretched(sprite_index, image_index, x - _spr_w, y - _spr_w + sprite_get_height(mask_index)/4 + z, 2*_spr_w, 2*_spr_w);