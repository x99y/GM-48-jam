var _gravity = 0.15;

for (var _i = array_length(popups) - 1; _i >= 0; _i--) {
    var _p = popups[_i];
    _p.timer++;
    
    // Apply gravity and move
    _p.vy += _gravity;
    _p.px += _p.vx;
    _p.py += _p.vy;
    
    if (_p.timer >= _p.duration) array_delete(popups, _i, 1);
}