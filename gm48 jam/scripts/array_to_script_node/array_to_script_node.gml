function array_to_script_node(_arr){
    if array_length(_arr) == 0 return noone
    
    var _next = noone
    
    for(var i = array_length(_arr) - 1; i >= 0; i--){
        var _item = _arr[i]
        var _node
        
        if _item[0] == SELECTION_TYPE.CONDITIONAL{
            _node = {
                is_condition: true,
                condition: _item[1],
                check: _item[2],
                next_yes: array_to_script_node(_item[3]),
                next_no: array_to_script_node(_item[4]),
                next: _next
            }
            
            _append_next_to_branch(_node.next_yes, _next)
            _append_next_to_branch(_node.next_no, _next)
            
        }else{
            _node = {
                is_condition: false,
                script: _item[0],
                args: [],
                next: _next
            }
            if array_length(_item) > 1{
                array_copy(_node.args, 0, _item, 1, array_length(_item) - 1)
            }
        }
        
        _next = _node
    }
    
    return _next
}