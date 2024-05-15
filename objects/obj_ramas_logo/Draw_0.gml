///@desc Drawing itself

if (state == 0) draw_self();
else {
	draw_sprite(spr_ramas_logo, 0, 0, 0);
	if (glow_alpha < 1) {
		glow_alpha += 1/40;
		
		if (glow_alpha >= 1) {
			state = 2;
			glow_alpha = 1;
			alarm[0] = 30;
		}
	}
	draw_sprite_ext(spr_ramas_logo_glow, 0, 0, 0, 1, 1, 0, c_white, glow_alpha);
	
	if (state >= 3) {
		draw_set_valign(fa_bottom);
		draw_set_font(global.small_font);
		draw_text(4, 180 - 2, "Including art by Kika!");
		draw_set_valign(fa_top);
	}
	
	if (state == 4) {
		black_alpha += 1/40;
		if (black_alpha >= 1) {
			room_goto(rm_menu);
		}
	}
}

draw_sprite_ext(spr_pixel, 0, -5, -5, 320 + 10, 180 + 10, 0, c_black, black_alpha);