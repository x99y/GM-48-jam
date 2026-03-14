function hide_hand(){
	for(var i = 0; i < ds_list_size(global.hand); i++){
		var _cur = global.hand[| i]
		_cur.move_to(_cur.x_dest,GUI_CARD_HIDDEN_Y,CARD_STATE.HIDDEN,20)
	}
}