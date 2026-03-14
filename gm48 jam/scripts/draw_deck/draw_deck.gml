function draw_deck(_collection_to_draw)
{
	sorted_list = _collection_to_draw;

	var cards_per_row = (DECK_DISPLAYED_CARDS_PER_ROW);

	var deck_w = (GUI_VIEW_DECK_WIDTH);
	var deck_h = (GUI_VIEW_DECK_HEIGHT);

	var card_aspect = (GUI_CARD_HEIGHT) / (GUI_CARD_WIDTH);

	var card_wsep = deck_w * 0.02;

	var card_w = (deck_w - card_wsep * (cards_per_row + 1)) / cards_per_row;
	var card_h = card_w * card_aspect;

	var start_x = (GUI_VIEW_DECK_XOFFSET) + card_wsep + card_w * 0.5;

	sorted_list = sortCards(global.current_deck);

	var can_move = (deck_pos != last_pos and oPlayerController.state = player_viewing_deck)

	for (var i = 0; i < ds_list_size(sorted_list); i++) {
	    var _card = sorted_list[| i];

	    var col = i mod cards_per_row;
	    var row = i div cards_per_row;

	    var xx = start_x + col * (card_w + card_wsep);
	    var yy = (GUI_VIEW_DECK_YOFFSET) + card_h * 0.5
	            + row * (card_h + (GUI_VIEW_DECK_SEP))
	            - deck_pos; // deck_pos is pixel offset

		if can_move{
		    _card.move_to(xx, yy, (CARD_STATE.SHOWING_DECK), 15);
		}
		
		_card.step()
		_card.draw()
		
	}
	
	last_pos = deck_pos 
}