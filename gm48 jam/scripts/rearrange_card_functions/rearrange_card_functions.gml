function rearrange_hand(_curve = true){
	fit_ds_list_sprite_in_width(global.hand,GUI_CARD_WIDTH,GUI_HAND_MAX_WIDTH,GUI_HAND_MARGIN_SIDE,GUI_CARD_IN_HAND_Y,_curve)
}

function rearrange_hand_with_selected(){
	fit_ds_list_sprite_in_width_ext(global.hand,GUI_CARD_WIDTH,GUI_HAND_MAX_WIDTH_HELD_CARD,GUI_HAND_MARGIN_SIDE_HELD_CARD,GUI_CARD_IN_HAND_Y)
}


function fit_ds_list_sprite_in_width_ext(_array,_sprite_width,_max_width,_xx,_yy){
		
	var _fit = false
	var _ds_size = ds_list_size(_array)+1

	var _padding = (_max_width - _sprite_width * _ds_size) / (_ds_size+1)
	var width_showing = min(_sprite_width,(_max_width-_sprite_width)/(_ds_size-1))
	
	var _pos = 0;
	
	for(var i = 0; i < _ds_size; i ++){
		
		if !_fit{
			if _pos != _ds_size - 1{
				if device_mouse_x_to_gui(0) <= _array[| _pos].x{
					_fit = !_fit
					continue
				}
			}else{
				continue	
			}
		}
		
		//set card positions
		var x_location = _xx+width_showing*i
		if (_padding >= 0){
			x_location += _padding*(i+1)
		}
		
		_array[| _pos].move_to(x_location+_sprite_width/2,_yy,CARD_STATE.IDLE,30)
		_array[| _pos].image_angle = 0
		_pos ++
	}
}


function fit_ds_list_sprite_in_width(_array,_sprite_width,_max_width,_xx,_yy, _curve = false){
		
	var _ds_size = ds_list_size(_array)

	var _padding = (_max_width - _sprite_width * _ds_size) / (_ds_size+1)
	var width_showing = min(_sprite_width,(_max_width-_sprite_width)/(_ds_size-1))
	
	for(var i = 0; i < _ds_size; i ++){
		
		//set card positions
		var x_location = _xx+width_showing*i
		if (_padding >= 0){
			x_location += _padding*(i+1)
		}
		
		

		var _x = x_location+_sprite_width/2
		var _y = _yy
		
		if _curve{
			_y = _y-get_card_angle_height(_x)
		}

		_array[| i].move_to(_x,_y,CARD_STATE.IN_HAND,20)
	}

}
