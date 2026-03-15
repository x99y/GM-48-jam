
var _enemy_count = ds_list_size(enemy_list)

for(var i = 0; i < _enemy_count; i ++){
	var _cur_entity = enemy_list[| i]
	_cur_entity.draw()
}


player_time ++
if player_time <= player_time_to{
	player_x = ease_in_out(player_time, player_startx, player_xto - player_startx,player_time_to)
}

draw_sprite_ext(sPlayer,0,player_x,LANE_PLAYER_Y,1,1,0,c_white,1)
