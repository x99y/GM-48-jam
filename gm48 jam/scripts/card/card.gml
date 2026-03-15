function card(_ID = 0) constructor{
	ID = _ID

	state = CARD_STATE.IDLE
	next_state = CARD_STATE.IDLE
	
	play_selection_requirement = noone

	draw_width = (GUI_CARD_WIDTH)
	draw_height  = (GUI_CARD_HEIGHT)
	
	current_width = draw_width
	current_height = draw_height
	
	xscale = 1
	yscale = 1
	
	sprite_index = noone
	image_index = 0
	image_angle = 0
	x = 0
	y = 0
	
	image_xscale = 1
	image_yscale = 1
	
	angle = 0
	time = 0
	moving = false

	function switch_state(_state){
		time = 0
		
		switch(_state){
			case CARD_STATE.HOVER:
				
				if state != CARD_STATE.HOVER prev_state = state
				
				xscale = 1.2
				yscale = 1.2
				image_angle = 0 
			break
			case CARD_STATE.DISPLAY:
				xscale = 1
				yscale = 1
				draw_width = GUI_DISPLAYED_CARD_WIDTH
				draw_height= GUI_DISPLAYED_CARD_HEIGHT			
				
				current_keyword_id = -1
				
				image_angle = 0 
			break
			case CARD_STATE.MOVE:
				x_start = x
				y_start = y
			break
			case CARD_STATE.SHOWING_DECK:
				image_angle = 0 
				angle_speed = random_range(0.008,0.015)
				angle_height = random_range(0.75,1.75)
				flip = choose(-1,1)
				float_height = random_range(2,4) * choose(-1,1)
				float_speed = random_range(0.025,0.035)
				
				xscale = 1
				yscale = 1
				draw_width = GUI_VIEW_DECK_CARD_WIDTH
				draw_height= GUI_VIEW_DECK_CARD_HEIGHT	
			break
			case CARD_STATE.IN_HAND:
				xscale = 1
				yscale = 1
				draw_width = GUI_CARD_WIDTH
				draw_height= GUI_CARD_HEIGHT

				float_height = random_range(2.5,4.5)// * choose(-1,1)
				float_speed = random_range(0.025,0.035)
				
				image_angle = get_card_angle(x_dest)
			break
		
			default:			
				xscale = 1
				yscale = 1
				angle_speed = random_range(0.01,0.02)
				angle_height = random_range(0.55,0.35)
				flip = choose(-1,1)
				draw_width = GUI_CARD_WIDTH
				draw_height= GUI_CARD_HEIGHT			

				image_angle = 0

			break
		}
		
		state = _state	
	}


	function move_to(_xTo, _yTo, _next_state, _time_to = 10){
		y_dest = _yTo
		x_dest = _xTo
		next_state = _next_state
		time_to = _time_to
		
		switch_state(next_state)
		switch_state(CARD_STATE.MOVE)	
	}

	function step(){
		
		switch (state){
			case CARD_STATE.HOVER:
					
				if oPlayerController.selected_card != self {
					switch_state(prev_state)
				}

				break;
			
			
			case CARD_STATE.MOVE:
				time ++
				if time <= time_to{
					x = ease_out(time, x_start, x_dest - x_start,time_to)
					y = ease_out(time, y_start, y_dest - y_start,time_to)
				}else{
					switch_state(next_state)
				}
			break;
				
			case CARD_STATE.HELD:
				x = lerp(x, x_dest, 0.25)
				y = lerp(y, y_dest, 0.25)
			break;

			case CARD_STATE.IN_HAND:
				
				time ++
				y = float_height*sin(time*float_speed) + y_dest
				
			break;
			
			case CARD_STATE.SHOWING_DECK:
				time ++
				y = float_height*sin(time*float_speed) + y_dest
				image_angle = angle_height*sin(time*(angle_speed*flip))
			break;
			
			case CARD_STATE.PLAY:
			
				time ++
				y = float_height*sin(time*float_speed) + y_dest
				image_angle = angle_height*sin(time*(angle_speed*flip))
			break;
		}
		adjust_scale()
		
		
	}
	
	function adjust_scale(){
		
		if current_width != draw_width*xscale{
			current_width = lerp(current_width, draw_width*xscale, 0.25)
		}
		if current_height != draw_height*yscale{
			current_height = lerp(current_height, draw_height*yscale, 0.25)
		}		
		if angle != image_angle{
			angle = lerp(angle,image_angle,0.3)	
		}
		
		
		image_xscale = current_width/((CARD_BASE_WIDTH)*(GUI_CARD_SPRITE_SCALE))
		image_yscale = current_height/((CARD_BASE_HEIGHT)*(GUI_CARD_SPRITE_SCALE))
	}	
	
	
	function point_colliding(_xx, _yy){
		if (_xx < x + draw_width/2 and x - draw_width/2 < _xx) and 
			(_yy > y - draw_height/2 and y + draw_height/2 > _yy){
			return true
		}
		return false
	}	
		
	function draw(){

		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,angle,c_white,1)
		
		
	}

}