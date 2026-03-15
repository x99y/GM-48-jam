randomize()
popups = []


function add(_text, _x, _y, _col, _duration = 40) {
    array_push(popups, {
        text		: _text,
        x			: _x,
        y			: _y,
        col			: _col,
        vx			: random_range(-2, 2),   
        vy			: random_range(-4, -2),
        timer		: 0,
        duration	: _duration,
        px			: _x,
        py			: _y,
		fnt			: fntData
    });
}

function add_warning(_text, _x, _y, _col, _duration = 40) {
    array_push(popups, {
        text		: _text,
        x			: _x,
        y			: _y,
        col			: _col,
        vx			: random_range(-2, 2),   
        vy			: random_range(-4, -2),
        timer		: 0,
        duration	: _duration,
        px			: _x,
        py			: _y,
		fnt			: fntBigData
    });
}


function add_value(_value, _x, _y, _duration = 40) {
    var _col  = _value > 0 ? c_green : c_red;
    var _text = (_value > 0 ? "+" : "") + string(_value);
    add(_text, _x, _y, _col, _duration);
}

function clear_all() {
    popups = [];
}

depth = -99