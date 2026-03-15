var _cur_shader = shader_current();
shader_reset();
draw_set_font(fntData);

for (var _i = 0; _i < array_length(popups); _i++) {
    var _p = popups[_i];
    
    var _progress = ease_in_out(_p.timer, 0, 1, _p.duration);
    var _alpha    = 1 - _progress;
    
    draw_set_alpha(_alpha);
    draw_set_color(_p.col);
    draw_text(_p.px, _p.py, _p.text);
}

draw_set_alpha(1);
draw_set_color(c_white);
shader_set(_cur_shader);