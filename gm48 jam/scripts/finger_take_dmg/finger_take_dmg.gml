function finger_take_dmg(_dmg) {
    // Build a shuffled copy to try in random order
    var _pool = array_create(array_length(global.player_fingers))
    array_copy(_pool, 0, global.player_fingers, 0, array_length(global.player_fingers))
    array_shuffle(_pool)
    
    for (var i = 0; i < array_length(_pool); i++) {
        if _pool[i].hp > 0 {
            _pool[i].hp -= _dmg
			
			var _gx = (oBoardRenderer.player_x / room_width) * VIEW_WIDTH
			var _gy = ((LANE_PLAYER_Y - 30) / room_height) * VIEW_HEIGHT
			popup_handler.add_value(-_dmg,_gx,_gy)
			
			camera_shake(10,0.75)
			var _sfx_break = audio_play_sound(sfx_break1, 1, false);
			audio_sound_pitch(_sfx_break, random_range(0.8, 1.2));
			
			if  _pool[i].hp <=0{
				_pool[i].hp = 0
							
				_pool[i].state = FINGER_STATE.DESTROYED
				_pool[i].image_index = 1
			
				camera_shake(12,0.75)
				var _sfx_break = audio_play_sound(sfx_break1, 1, false);
				audio_sound_pitch(_sfx_break, random_range(0.8, 1.2));
				var _spawn = _pool[i].x_y_offset()
				popup_handler.add("DESTROYED", _spawn.x,_spawn.y,c_red,35)
							
			}
			
            return
        }
    }
	//if cant find
	//player death
	game_restart()
}