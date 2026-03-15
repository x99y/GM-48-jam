if moving{
	x = ease_in_out(time,x_start,x_to-x_start,time_to_pos)
	y = ease_in_out(time,y_start,y_to-y_start,time_to_pos)
	

	if x_scale != x_scale_dest{
		x_scale = ease_out(time,x_scale_start, x_scale_dest - x_scale_start, time_to_pos)
	}
	
	if y_scale != y_scale_dest{
		y_scale = ease_out(time,y_scale_start, y_scale_dest - y_scale_start, time_to_pos)
	}
	
	update_finger_pos()

	time ++
	
	if time > time_to_pos{
		moving = false	
	}
}

time += 0.1;