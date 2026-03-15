function next_turn(){
	
	if alarm[0] <= 0{

    while ds_list_size(global.hand) > 0 {
        ds_list_add(global.discard, global.hand[| 0])
        ds_list_delete(global.hand, 0)
    }
	
    enemies_execute_intent()
	
	if ds_list_size(oBoardRenderer.enemy_list) = 0{
		repeat(irandom_range(2,4)){
			create_entity()
		}
	}
	
    enemies_declare_intent()
	
    // Draw new hand
	draw_count = 0
	


	alarm[0] = 10
	}
}

function first_turn(){
	
    enemies_declare_intent()
	
    // Draw new hand
    repeat (4) {
		draw_card()
    }
	
	switch_state(player_on_board)
}