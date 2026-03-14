function get_card_angle(_x){
	var w = 0.00010
	var l =	VIEW_WIDTH
	return darctan( -2*w*_x+w*l )
}