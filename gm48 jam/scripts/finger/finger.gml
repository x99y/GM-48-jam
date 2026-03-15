function finger(_sprite, _xoffset, _yoffset) constructor{
	_colors = __config_colours()

	sprite_index = _sprite
	x = 0
	y = 0
	
	x_offset = _xoffset
	y_offset = _yoffset
	
	image_index = 0
	xscale = 1
	yscale = 1
	
	image_alpha = 1
	

	//Glow animation
	glow_timer = 0
    glow_duration = 35
    glow_alpha = 0
    glow_phase = 0
	glow = false
	
	
	state = FINGER_STATE.BIOLOGICAL
	selected = false
	
	status_effects = array_create(STATUS_EFFECT.COUNT,irandom_range(0,2))
	
	hp = 5
	max_hp = hp
	corruption = 0
	
	//info 
	info_timer = 0;
	info_duration = 20;
	
	
	function draw(_xoffset, _yoffset){

	    var _draw_x = x + _xoffset;
	    var _draw_y = y + _yoffset;

		draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, c_white, image_alpha);

		// Handle glow animation
		if (glow) {

		    glow_timer += 1;
		    if (glow_phase == 0) {
		        glow_alpha = ease_in_out(glow_timer, 0, 1, glow_duration);
		        if (glow_timer >= glow_duration) {
		            glow_timer = 0;
		            glow_phase = 1;
		        }
		    } else {
		        glow_alpha = ease_in_out(glow_timer, 1, -1, glow_duration);
		        if (glow_timer >= glow_duration) {
		            glow_timer = 0;
		            glow_phase = 0;
		        }
		    }

		    var _current_shader = shader_current();
		    shader_reset();
    
		    if (state == FINGER_STATE.DESTROYED) {
				draw_sprite_ext(sprite_index, 0, _draw_x, _draw_y, xscale, yscale, 0, c_white, 0.3);
				gpu_set_blendmode(bm_add);
				draw_sprite_ext(sprite_index, 0, _draw_x, _draw_y, xscale, yscale, 0, c_white, 0.6 + sin(info_timer * 0.05) * 0.2);
				draw_sprite_ext(sprite_index, 0, _draw_x, _draw_y, xscale, yscale, 0, c_white, 0.3);
				gpu_set_blendmode(bm_normal);
		    } else {
		        draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, _colors.c_surge, glow_alpha * 0.6);
		        gpu_set_blendmode(bm_add);
		        draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, _colors.c_surge, glow_alpha);
		        draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, _colors.c_surge, glow_alpha * 0.5);
		        gpu_set_blendmode(bm_normal);
		    }
    
		    shader_set(_current_shader);
		    draw_info();
		} else {
		    info_timer = 0;
		}
		
		//Handle select animation
		if (selected) {
		    var _current_shader = shader_current();
		    shader_reset();
		    draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, c_white, 0.4 + sin(current_time * 0.005) * 0.1);
		    gpu_set_blendmode(bm_add);
		    draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, c_white, 0.6 + sin(current_time * 0.005) * 0.1);
		    draw_sprite_ext(sprite_index, image_index, _draw_x, _draw_y, xscale, yscale, 0, c_white, 0.4);
		    gpu_set_blendmode(bm_normal);
		    shader_set(_current_shader);
		}
		/*/ Draw collision box
		draw_set_color(c_red);
		var _left   = sprite_get_bbox_left(sprite_index);
		var _right  = sprite_get_bbox_right(sprite_index);
		var _top    = sprite_get_bbox_top(sprite_index);
		var _bottom = sprite_get_bbox_bottom(sprite_index);
		var _ox = sprite_get_xoffset(sprite_index);
		var _oy = sprite_get_yoffset(sprite_index);
		var _x1 = x + (_left  - _ox) * xscale;
		var _x2 = x + (_right - _ox) * xscale;
		var _y1 = y + (_top   - _oy) * yscale;
		var _y2 = y + (_bottom - _oy) * yscale;
		draw_rectangle(_x1, _y1, _x2, _y2, true);
		//*/
    }

	function x_y_offset(){
		var _ox = sprite_get_xoffset(sprite_index);
		var _oy = sprite_get_yoffset(sprite_index);
		return {
		    x : x + (sprite_get_bbox_left(sprite_index) - _ox) * xscale,
			y : y + (sprite_get_bbox_top(sprite_index)  - _oy) * yscale
		}
	}


	function draw_info() {
	    var _slide_dist = 10;
	    var _stagger = 2;
	    var _duration = 12;
		
		//var _pos = x_y_offset()
		//var xx = _pos.x + 25
		///var yy = _pos.y - 40
		
		var xx = x + 100
		var yy = y + 40
		
	    info_timer++;
    
	    var _status_data = __status_effect_data();
	    var _items = [];
    
	    var _cur_shader = shader_current();
	    shader_reset();
	    draw_set_font(fntHandData);
    
	    var _line_height = string_height("HP: 0") + 4;
	
		
		var _state_label = ""
		var _state_col = c_white
		var _status = true
		switch(state){
			case FINGER_STATE.BIOLOGICAL: 
				_state_label = "BIOLOGICAL" 
				_state_col = _colors.c_bio
			break	
			case FINGER_STATE.MECHANICAL: 
				_state_label = "MECHANICAL" 
				_state_col = _colors.c_mech 
			break	
			case FINGER_STATE.DESTROYED:  
				_state_label = "DESTROYED" 
				_state_col = _colors.c_destroy
				_status = false
			break	
			
			break
		}
		array_push(_items, { label: _state_label, col : _state_col})
		
		
		if _status{
		
		    array_push(_items, { label: "HP: " + string(hp) + "/" + string(max_hp), col: c_green });
	
		    for (var _i = 0; _i < STATUS_EFFECT.COUNT; _i++) {
		        if (status_effects[_i] > 0) {
		            array_push(_items, {
		                label: _status_data[_i].name + ": " + string(status_effects[_i]),
		                col: _status_data[_i].color
		            });
		        }
		    }
		}
    
	    var _total = array_length(_items);
    
	    for (var _i = 0; _i < _total; _i++) {
	        var _t = clamp(info_timer - (_i * _stagger), 0, _duration);
	        var _progress = ease_in_out(_t, 0, 1, _duration);
        
	        var _offset_y = lerp(_slide_dist, 0, _progress);
	        var _iy = yy - (_i * _line_height) + _offset_y;
        
	        draw_set_alpha(_progress);
	        draw_set_color(_items[_i].col);
	        draw_text(xx, _iy, _items[_i].label);
	    }
    
	    draw_set_alpha(1);
	    draw_set_color(c_white);
	    shader_set(_cur_shader);
	}
}