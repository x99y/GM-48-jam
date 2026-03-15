randomize()

global.lane = array_create(4,noone)

__enemy_data()

enemy_list = ds_list_create()

repeat(irandom_range(1,3)){
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