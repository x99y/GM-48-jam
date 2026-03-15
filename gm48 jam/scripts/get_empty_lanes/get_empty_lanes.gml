function get_empty_lanes(){
	
	var _lanes = []
	
	for(var i = 0; i < array_length(global.lane); i++){
		if global.lane[i] == noone{
			array_push(_lanes, i)	
		}
	}
	
	
	if array_length(_lanes) = 0{
		return false
	}
	
	
	return _lanes
}