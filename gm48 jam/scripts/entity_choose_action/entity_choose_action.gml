function entity_choose_action(_entity) {
    if _entity.actions == noone || array_length(_entity.actions) == 0 { return noone }
    
    var _total = 0
    for (var i = 0; i < array_length(_entity.actions); i++) {
        _total += _entity.actions[i].weight
    }
    
    var _roll = irandom(_total - 1)
    var _cumulative = 0
    for (var i = 0; i < array_length(_entity.actions); i++) {
        _cumulative += _entity.actions[i].weight
        if _roll < _cumulative {
            return _entity.actions[i]
        }
    }
}


function entity_do_action(_entity, _action) {
    if _action == noone { return }
    if struct_exists(_action, "args") {
        _action.action(_entity, _action.args)
    } else {
        _action.action(_entity)
    }
}