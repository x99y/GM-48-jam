randomize()

global.lane = array_create(4,noone)

__enemy_data()

enemy_list = ds_list_create()

repeat(1){
	create_entity()
}

player_lane = 0

player_x = get_lane_x(player_lane)
player_startx = player_x
player_time = 0
player_time_to = 15
player_xto = player_x


player_breathe_timer = 0
player_breathe_speed = 0.02
player_breathe_amount = 0.05

info_entity = noone
info_timer = 0


function draw_entity_info() {
    if info_entity == noone exit
    
    var _colors = __config_colours()
    var _slide_dist = 10
    var _stagger = 2
    var _duration = 12
	
    var _gui_x = (info_entity.x / room_width) * VIEW_WIDTH
    var _gui_y = (LANE_TOP_Y / room_height) * VIEW_HEIGHT
    
    var xx = _gui_x + sprite_get_width(info_entity.sprite_index) + 20
    var yy = _gui_y

    info_timer++

    var _status_data = __status_effect_data()
    var _items = []


    draw_set_font(fntHandData)

    var _line_height = string_height("HP: 0") + 4


    array_push(_items, { label: info_entity.name, col: c_white })


    array_push(_items, { label: $"HP: {info_entity.hp}/{info_entity.maxhp}", col: c_green })

    array_push(_items, { label: "STR: " + string(info_entity.str), col: _colors.c_bio })
    array_push(_items, { label: "DEX: " + string(info_entity.dex), col: _colors.c_mech })


    for (var _i = 0; _i < STATUS_EFFECT.COUNT; _i++) {
        if (info_entity.status_effects[_i] > 0) {
            array_push(_items, {
                label: _status_data[_i].name + ": " + string(info_entity.status_effects[_i]),
                col: _status_data[_i].color
            })
        }
    }

    var _total = array_length(_items)


    for (var _i = 0; _i < _total; _i++) {
        var _t = clamp(info_timer - (_i * _stagger), 0, _duration)
        var _progress = ease_in_out(_t, 0, 1, _duration)

        var _offset_y = lerp(_slide_dist, 0, _progress)
        var _iy = yy + (_i * _line_height) + _offset_y

        var _label = _items[_i].label
        var _tw = string_width(_label)
        var _th = string_height(_label)
        var _pad = 4

        // Background box
        draw_set_alpha(_progress * 0.75)
        draw_set_color(c_black)
        draw_rectangle(xx - _pad, _iy - _pad, xx + _tw + _pad, _iy + _th + _pad, false)

        // Text
        draw_set_alpha(_progress)
        draw_set_color(_items[_i].col)
        draw_text(xx, _iy, _label)
    }

    draw_set_alpha(1)
    draw_set_color(c_white)

}