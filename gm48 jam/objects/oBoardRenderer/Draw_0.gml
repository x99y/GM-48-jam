
var _enemy_count = ds_list_size(enemy_list)

for(var i = 0; i < _enemy_count; i ++){
	var _cur_entity = enemy_list[| i]
	_cur_entity.draw()
}


player_time ++
if player_time <= player_time_to{
	player_x = ease_in_out(player_time, player_startx, player_xto - player_startx,player_time_to)
}


player_breathe_timer += player_breathe_speed
var _breathe = sin(player_breathe_timer) * player_breathe_amount

var _w = sprite_get_width(sPlayer)
var _h = sprite_get_height(sPlayer)

var _px = round(_w * (1 + _breathe)) / _w
var _py = round(_h * (1 - _breathe)) / _h

draw_sprite_ext(sPlayer, 0, player_x, LANE_PLAYER_Y, _px, _py, 0, c_white, 1)