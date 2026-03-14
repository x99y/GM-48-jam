function hide_deck(){

	with oCardRenderer{

		if ds_list_empty(sorted_list) return

	
		for (var i = 0; i < ds_list_size(sorted_list); i++)
		{
			var _card = sorted_list[|i]
			_card.move_to(_card.x, VIEW_HEIGHT*1.5, CARD_STATE.HIDDEN, 15);
			
		}
		

		alarm[0] = 15
	}
}