function finger(_sprite, _xoffset, _yoffset) constructor{
	sprite_index = _sprite
	x = 0
	y = 0
	
	x_offset = _xoffset
	y_offset = _yoffset
	
	image_index = 0
	xscale = 1
	yscale = 1
	
	image_alpha = 1
	
	glow = false
	
	//Glow animation
	glow_timer = 0
    glow_duration = 35
    glow_alpha = 0
    glow_phase = 0
	
	state = FINGER_STATE.BIOLOGICAL
	selected = false
	
	status_effects = array_create(STATUS_EFFECT.COUNT)
	
	hp = 10
	corruption = 0
	
	
	function draw(_xoffset, _yoffset){
	    var _draw_x = x + _xoffset;
	    var _draw_y = y + _yoffset;

	    draw_sprite_ext(sprite_index,image_index,_draw_x,_draw_y,xscale,yscale,0,c_white,image_alpha);

        // Handle glow animation
        if (glow){
			var _colors = __config_colours()
			
            // Update glow timer
            glow_timer += 1;

            if (glow_phase == 0) {
                // fading in
                glow_alpha = ease_in_out(glow_timer, 0, 1, glow_duration);
                if (glow_timer >= glow_duration) {
                    glow_timer = 0;
                    glow_phase = 1;
                }
            } else {
                // fading out
                glow_alpha = ease_in_out(glow_timer, 1, -1, glow_duration); // from 1 to 0
                if (glow_timer >= glow_duration) {
                    glow_timer = 0;
                    glow_phase = 0;
                }
            }

            draw_set_color(c_white);
            draw_set_alpha(glow_alpha);
			
            draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, _colors.c_surge, glow_alpha);
            draw_set_alpha(1);
			
        }
    }


	    /*/ draw_collision box
	    draw_set_color(c_red);

	    var _left   = sprite_get_bbox_left(sprite_index);
	    var _right  = sprite_get_bbox_right(sprite_index);
	    var _top    = sprite_get_bbox_top(sprite_index);
	    var _bottom = sprite_get_bbox_bottom(sprite_index);

	    var _ox = sprite_get_xoffset(sprite_index);
	    var _oy = sprite_get_yoffset(sprite_index);

	    var _x1 = _draw_x + (_left  - _ox) * xscale;
	    var _x2 = _draw_x + (_right - _ox) * xscale;
	    var _y1 = _draw_y + (_top   - _oy) * yscale;
	    var _y2 = _draw_y + (_bottom- _oy) * yscale;

	    draw_rectangle(_x1, _y1, _x2, _y2, false);
		/*/
}