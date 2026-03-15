function action_buff(_entity, _stat, _amount) {
    _entity[$ _stat] += _amount
}

function buff_attack(_entity, _amount) {
    _entity.str += _amount
}

function buff_dex(_entity, _amount) {
    _entity.dex += _amount
}

function heal(_entity, _amount) {
    _entity.hp = min(_entity.hp + _amount, _entity.maxhp)
}