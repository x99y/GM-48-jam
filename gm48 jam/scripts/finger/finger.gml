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
	
	function draw(_xoffset, _yoffset){
	    var _draw_x = x + _xoffset;
	    var _draw_y = y + _yoffset;

	    draw_sprite_ext(sprite_index,image_index,_draw_x,_draw_y,xscale,yscale,0,c_white,image_alpha);

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
}