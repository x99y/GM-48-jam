function action_hit_fstrength(_entity) {
    if oBoardRenderer.player_lane == _entity.lane {
        finger_take_dmg(_entity.str)
    }
}

function action_hit_fdex(_entity) {
    if oBoardRenderer.player_lane == _entity.lane {
        finger_take_dmg(_entity.dex)
    }
}