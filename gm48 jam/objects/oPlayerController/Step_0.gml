if mouse_check_button_pressed(mb_left){
	clicked = true
	selected_start_mousex = device_mouse_x_to_gui(0)
	selected_start_mousey =  device_mouse_y_to_gui(0)	
}else{
	var wheel = mouse_wheel_down() - mouse_wheel_up()

	if(wheel != 0) {
		wheel *= 0.1	
		with oCamera{	
			target_width = clamp(target_width *(wheel + 1), global.camera_max_width *0.4,global.camera_max_width)
			target_height = clamp(target_height*(wheel + 1), global.camera_max_height*0.4,global.camera_max_height)
		}
		
	}
			
}




if clicked{
	var _release = mouse_check_button_released(mb_left)

	//move camera by 
	var _device_mouse_x = device_mouse_x_to_gui(0)
	var _device_mouse_y = device_mouse_y_to_gui(0)	
	
	var move_x = _device_mouse_x - selected_start_mousex;
	var move_y = _device_mouse_y - selected_start_mousey;
	
	if move_x != 0{
		var new_x = oCamera.x_to - move_x * CAMERA_MOVE_SPEED * oCamera.current_width/global.camera_max_width
		var current_w = oCamera.current_width
		
		//Limit the screen
		if new_x < 0{
			new_x = new_x*exp(CAMERA_LOCK_STRENGTH*new_x/current_w)
		}else{
			var _upper_bound = global.camera_max_width - current_w
			
			if new_x > _upper_bound{
				new_x = _upper_bound + (new_x-_upper_bound)*exp(CAMERA_LOCK_STRENGTH*(_upper_bound-new_x)/current_w)
			}
		}
		
		oCamera.x_to = new_x
		
		selected_start_mousex = _device_mouse_x
	}
	
	if move_y != 0{
		var current_h = oCamera.current_height
		var new_y = oCamera.y_to - move_y * CAMERA_MOVE_SPEED * current_h/global.camera_max_height
		
		
		//Limit the screen
		if new_y < 0{
			new_y = new_y*exp(CAMERA_LOCK_STRENGTH*new_y/current_h)
		}else{
			var _upper_bound = global.camera_max_height - current_h
			
			if new_y > _upper_bound{
				new_y = _upper_bound + (new_y-_upper_bound)*exp(CAMERA_LOCK_STRENGTH*(_upper_bound-new_y)/current_h)
			}
		}
		
		oCamera.y_to = new_y
	
		selected_start_mousey = _device_mouse_y
	}

	
	if _release{
		clicked = false
		oCamera.lock_to_board = true
	}
}