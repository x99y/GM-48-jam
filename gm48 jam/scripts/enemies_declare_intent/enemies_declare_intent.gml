function enemies_declare_intent(){
    var _list = oBoardRenderer.enemy_list
    for (var i = 0; i < ds_list_size(_list); i++) {
        var _entity = _list[| i]
        _entity.intent = entity_choose_action(_entity)
    }
}

function enemies_execute_intent(){
    var _list = oBoardRenderer.enemy_list
    for (var i = 0; i < ds_list_size(_list); i++) {
        var _entity = _list[| i]
        entity_do_action(_entity, _entity.intent)
        _entity.intent = noone
    }
}