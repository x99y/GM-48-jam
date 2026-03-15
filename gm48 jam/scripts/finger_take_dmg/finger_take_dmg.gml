function finger_take_dmg(_dmg) {
    // Build a shuffled copy to try in random order
    var _pool = array_create(array_length(global.player_fingers))
    array_copy(_pool, 0, global.player_fingers, 0, array_length(global.player_fingers))
    array_shuffle(_pool)
    
    for (var i = 0; i < array_length(_pool); i++) {
        if _pool[i].hp > 0 {
            _pool[i].hp -= _dmg
			
			if  _pool[i].hp <=0{
				_pool[i].hp = 0
							
				array_push(oPlayerController.revert_info[oPlayerController.current_selection], _finger.state)
							
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