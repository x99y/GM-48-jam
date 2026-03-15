function apply_status_to_finger(_finger, _status, _real_intensity){
    if _finger == noone{ return }
    
    var __effect_data = __status_effect_data()
    var _sign = _real_intensity > 0 ? "+" : "-"
    
    array_push(oPlayerController.revert_info[oPlayerController.current_selection], _finger.status_effects[_status])
    _finger.status_effects[_status] += _real_intensity
    
    var _spawn = _finger.x_y_offset()
    popup_handler.add($"{_sign}{_real_intensity} {status_data[_status].name}", _spawn.x, _spawn.y, 35)
}