
function show_flesh(){
	oHandRenderer.move_to(GUI_HAND_SHOWN_X,GUI_HAND_SHOWN_Y,15)
	animate("rise")

}


function hide_flesh(){
	oHandRenderer.move_to(GUI_HAND_HIDDEN_X,GUI_HAND_HIDDEN_Y,15)
	oHandRenderer.shake = false
	
	animate("hide")
}

function animate(_state){

	with oHandRenderer{
		var _animation = __config_animation()
	
		if !struct_exists(_animation[0], _state){
			show_debug_message("Animation state does not exist")
			return false	
		}
		
		sprite_hand = struct_get(_animation[5],_state)
	
		var _finger_count = array_length(global.player_fingers)
	
		for(var _i = 0; _i < _finger_count; _i ++){
			
			var _finger = global.player_fingers[_i]
			if _finger.state != FINGER_STATE.DESTROYED{
			
				_finger.sprite_index = struct_get(_animation[_i],_state)
				_finger.image_index = 0
			
			}else{
				_finger.sprite_index = struct_get(_animation[_i],"dmg")
				_finger.image_index = 1
			}
		
			_finger.glow = false
		}
				
		sprite_frame = 0
		
		if _state == "rise"{
			image_speed = 0.5
		}else{
			image_speed = 0
		}
		
	}
		
}