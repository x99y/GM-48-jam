function add_popup(_value, _col) {
    array_push(global.popups, {
        value: _value,
        col: _col,
        timer: 0,
        duration: 40,
        offset_y: 0
    });
}