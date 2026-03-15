function action_hit_sstrength(_entity) {
    var _left  = _entity.lane - 1
    var _right = _entity.lane + 1
    if oBoardRenderer.player_lane == _left || oBoardRenderer.player_lane == _right {
        finger_take_dmg(_entity.str)
    }
}

function action_hit_sdex(_entity) {
    var _left  = _entity.lane - 1
    var _right = _entity.lane + 1
    if oBoardRenderer.player_lane == _left || oBoardRenderer.player_lane == _right {
        finger_take_dmg(_entity.dex)
    }
}