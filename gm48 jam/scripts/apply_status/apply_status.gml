function apply_status_to_selection(_selection_num, _status, _intensity){
    
    var _real_intensity = _intensity
    if !safe_real(_real_intensity, false){
        if struct_exists(oPlayerController.selected_card, _real_intensity){
            _real_intensity = struct_get(oPlayerController.selected_card, _real_intensity)
            if is_string(_real_intensity){
                _real_intensity = string_to_formula(_real_intensity)
            }
        }
    }
    
    var _node = oPlayerController.node_history[_selection_num]
    var _selection = oPlayerController.selected_info[_selection_num]
    
    switch(_node.type){
        case SELECTION_TYPE.FINGER:
            var _fingers = is_array(_selection) ? _selection : [_selection]
            for(var _i = 0; _i < array_length(_fingers); _i++){
                apply_status_to_finger(global.player_fingers[_fingers[_i]], _status, _real_intensity)
            }
        break
        
        case SELECTION_TYPE.LANE:
            var _lanes = is_array(_selection) ? _selection : [_selection]
            for(var _i = 0; _i < array_length(_lanes); _i++){
                var _target = global.lane[_lanes[_i]]
                if _target == noone{ continue }
                player_apply_status(_target, _status, _real_intensity)
            }
        break
    }
    
    return true
}