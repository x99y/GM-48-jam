function action_move(_entity) {
    var _dir = sign(oBoardRenderer.player_lane - _entity.lane)
    if _dir == 0 { return }
    
    var _target_lane = clamp(_entity.lane + _dir, 0, 3)
    
    if global.lane[_target_lane] != noone { 
        _entity.move_and_back(_target_lane, 15, 0.5)
        return 
    }

	global.lane[_entity.lane] = noone
	global.lane[_target_lane] = _entity
    _entity.move_to_lane(_target_lane, 15)
}