function run_script_nodes(_node){
    if _node == noone return
    
    if _node.is_condition{
        if _node.condition(_node.check){
            run_script_nodes(_node.next_yes)
        }else{
            run_script_nodes(_node.next_no)
        }
        return
    }
	
    script_execute_ext(_node.script, _node.args)
    
    run_script_nodes(_node.next)
}
