function get_card_angle_height(_x){
	var w = 0.00010
	var l =	VIEW_WIDTH
	return -w*_x*(_x-l) - 50
}