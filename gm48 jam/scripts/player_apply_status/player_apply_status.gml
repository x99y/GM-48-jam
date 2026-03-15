function player_apply_status(_target, _status_effect, _intensity){
	var _effect_x= (_target.x / room_width) * VIEW_WIDTH
	var _effect_y =LANE_ENEMY_Y/room_height * VIEW_HEIGHT
	__status_effect_data()	
					

	_target.status_effects[_status_effect] += _intensity
		
	var _sign = "-"
	if _intensity > 0{
		_sign = "+"
	}
					
	popup_handler.add($"{_sign}{_intensity} {status_data[_status_effect].name}", _effect_x,_effect_y,35)
}