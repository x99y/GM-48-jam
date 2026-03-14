function sortCards(_list){
	var _sorted_list = ds_list_create()
	ds_list_copy(_sorted_list, _list)
	for(var i = 1; i < ds_list_size(_sorted_list); i ++){
		var _a = _sorted_list[| i]
		
		var _j = i - 1
		
		while _j >= 0 and _a.ID < _sorted_list[| _j].ID{
			_sorted_list[|_j + 1] = _sorted_list[|_j]
			_j --
		}
		
		_sorted_list[|_j + 1] = _a
	}
	
	
	return _sorted_list
}