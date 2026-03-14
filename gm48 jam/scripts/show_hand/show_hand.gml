function show_hand(){
	for(var i = 0; i < ds_list_size(global.hand); i++){
		var _cur = global.hand[| i]
		var _x = _cur.x_dest
		_cur.move_to(_x,GUI_CARD_IN_HAND_Y-get_card_angle_height(_x),CARD_STATE.IN_HAND,20)
	}
}