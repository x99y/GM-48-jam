function array_to_selection_node(_arr){
    if array_length(_arr) == 0 return noone
    
    // Build nodes back to front so each can point to the next
    var _next = noone
    
    for(var i = array_length(_arr) - 1; i >= 0; i--){
        var _item = _arr[i]
        var _node
        
        if (_item[0] == SELECTION_TYPE.CONDITIONAL){
			
            // Condition node
            _node = {
                is_condition: true,
                condition: _item[1],
                check: _item[2],
                next_yes: array_to_selection_node(_item[3]),
                next_no: array_to_selection_node(_item[4]),
                next: _next
            }
            
            // Append _next to the end of both branches
            _append_next_to_branch(_node.next_yes, _next)
            _append_next_to_branch(_node.next_no, _next)
            
        }else{
            // Normal step node
            _node = {
                is_condition: false,
                type: _item[0],
                args: [],
                next: _next
            }
            array_copy(_node.args, 0, _item, 1, array_length(_item) - 1)
        }
        
        _next = _node
    }
    
    return _next
}

// Walks to the end of a branch and attaches _next
function _append_next_to_branch(_node, _next){
    if _node == noone return
    if _node.next == noone{
        _node.next = _next
        return
    }
    _append_next_to_branch(_node.next, _next)
}