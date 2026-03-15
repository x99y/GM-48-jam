function finger_take_dmg(_dmg) {
    // Build a shuffled copy to try in random order
    var _pool = array_create(array_length(global.player_fingers))
    array_copy(_pool, 0, global.player_fingers, 0, array_length(global.player_fingers))
    array_shuffle(_pool)
    
    for (var i = 0; i < array_length(_pool); i++) {
        if _pool[i].hp > 0 {
            _pool[i].hp -= _dmg
            return
        }
    }
	//if cant find
	//player death
	game_restart()
}