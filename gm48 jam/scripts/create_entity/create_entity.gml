function create_entity(){
	
	var _target_lanes = get_empty_lanes()

	// full	
	if !is_array(_target_lanes){
		return false
	}
	
	//spawning lane
	var _spawn_lane = _target_lanes[irandom_range(0,array_length(_target_lanes)-1)]
	
	with oBoardRenderer{
		var ID = irandom(array_length(DATA_enemy)-1)
		var _stats = DATA_enemy[ID]
		new_enemy = new entity(ID) 
		
		new_enemy.sprite_index = _stats.sprite
		new_enemy.name = is_array(_stats.name) ? _stats.name[irandom(array_length(_stats.name) - 1)] : _stats.name
		new_enemy.hp = _stats.hp
		new_enemy.maxhp = _stats.hp
		
		new_enemy.str = _stats.str
		new_enemy.dex = _stats.dex
		
		lane = _spawn_lane
		
		new_enemy.actions = _stats.actions

		ds_list_add(enemy_list, new_enemy)
		
		global.lane[_spawn_lane] = new_enemy
		
		
		
		move_entity(new_enemy, _spawn_lane, 1)
		//new_enemy.x = get_lane_x(_spawn_lane)
		new_enemy.y = LANE_ENEMY_Y + random_range(10,-10)
	}
	
	return true
	
}