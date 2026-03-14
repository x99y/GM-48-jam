function card(_ID = 0) constructor{
	ID = _ID

	state = CARD_STATE.IDLE
	play_selection_requirement = noone

	sprite_index = noone
	image_index = 0
	x = 0
	y = 0
	
	image_xscale = 1
	image_yscale = 1
	
	angle = 0
	time = 0
	moving = false
	
	function step(){
		if moving{
			time ++
			if time <= time_to{
				x = ease_out(time, x_start, x_dest - x_start,time_to)
				y = ease_out(time, y_start, y_dest - y_start,time_to)
			}else{
				moving = false
			}
		}
	}
	
	function draw(){
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,angle,c_white,1)
	}

}