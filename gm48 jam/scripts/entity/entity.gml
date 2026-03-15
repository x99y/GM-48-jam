function entity(ID) constructor {
    ID = ID
    name = "Unknown"
    sprite_index = sEnemyBig
    image_index = 0
    hp = 10
    str = 1
    dex = 1

    x = 0
    y = 0
    image_xscale = 1
    image_yscale = 1.3

    lane = 0

    start_x = 0
    x_to = 0
    move_time = 0
    move_time_to = 15
	return_x = 0
	return_lane = 0
	is_returning = false

    actions = noone
	
    breathe_speed =random_range(0.024,0.035)
    breathe_amount = random_range(0.038,0.041)
    breathe_timer = 0
	image_speed = 0.015
	
	status_effects = array_create(STATUS_EFFECT.COUNT,0)
	
	intent = noone

	function move_and_back(_lane_to, _time_to, _bump_amount) {
	    var _origin_x = x
	    var _origin_lane = lane
		
	    var _target_x
	    if _lane_to < 0 {
	        _target_x = LANE_ONE_XOFFSET[0]
	    } else if _lane_to >= 4 {
	        _target_x = LANE_FOUR_XOFFSET[1]
	    } else {
	        _target_x = get_lane_x(_lane_to)
	    }

	    x_to = x + (_target_x - x) * _bump_amount
		move_time_to = _time_to
	    start_x = x
	    move_time = 0
	    return_x = _origin_x
	    return_lane = _origin_lane
	    is_returning = true
	}
	
	
    function move_to_lane(_lane, _time_to) {
        x_to = get_lane_x(_lane)
        move_time_to = _time_to
        start_x = x
        move_time = 0
        lane = _lane
    }

	function draw() {
	    // Movement
	    move_time++
	    if (move_time <= move_time_to) {
	        x = ease_in_out(move_time, start_x, x_to - start_x, move_time_to)
	    } else if (is_returning) {
			camera_shake(7, 0.5)
	        is_returning = false
	        start_x = x
	        x_to = return_x
	        move_time = 0
	    }
    
	    breathe_timer += breathe_speed
	    var _breathe = sin(breathe_timer) * breathe_amount
	    var _w = sprite_get_width(sprite_index)
	    var _h = sprite_get_height(sprite_index)
	    var _px = round(_w * (1 + _breathe)) / _w
	    var _py = round(_h * (1 - _breathe)) / _h
	    image_xscale = _px
	    image_yscale = _py

	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
	}

	function draw_gui(){
	    if intent == noone { return }
    
	    var _label = ""
	    var _col = c_white
	    switch (intent.intent_type) {
	        case INTENT_TYPE.ATTACKF: _label = "ATTACK"break
	        case INTENT_TYPE.ATTACKS: _label = "SWEEP" break
	        case INTENT_TYPE.MOVE:    _label = "MOVE" break
	        case INTENT_TYPE.BUFF:    _label = "BUFF" break
	        case INTENT_TYPE.HEAL:    _label = "HEAL" break
	    }
    
		var _gx = (x / room_width) * VIEW_WIDTH
		var _gy = ((y- sprite_get_height(sprite_index) + 8) / room_height) * VIEW_HEIGHT 
	    
		
		draw_set_font(fntHandData)
	    draw_set_halign(fa_center)
	    draw_set_color(_col)
	    draw_text(_gx, _gy, _label)
	    draw_set_color(c_white)
	    draw_set_halign(fa_left)
	}
}
