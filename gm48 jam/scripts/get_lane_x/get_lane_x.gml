function get_lane_x(_lane){
	var _lane_offsets = [LANE_ONE_XOFFSET, LANE_TWO_XOFFSET, LANE_THREE_XOFFSET, LANE_FOUR_XOFFSET]
		    
	 var _offset = _lane_offsets[_lane];
	 var _center_x = (_offset[0] + _offset[1]) / 2 + random_range(3,-3)
	 return _center_x
}