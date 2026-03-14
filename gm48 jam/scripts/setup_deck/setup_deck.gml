function setup_deck_view(){
	with oCardRenderer{
		ds_list_clear(sorted_list)

		cards_per_row = DECK_DISPLAYED_CARDS_PER_ROW;
		deck_shown = true
		deck_pos = 0
		last_pos = 0
		
		var deck_w = GUI_VIEW_DECK_WIDTH;
		var deck_h = GUI_VIEW_DECK_HEIGHT;

		var card_aspect = GUI_CARD_HEIGHT / GUI_CARD_WIDTH;


		var card_wsep = deck_w * 0.02;

		var card_w = (deck_w - card_wsep * (cards_per_row + 1)) / cards_per_row;
		var card_h = card_w * card_aspect;

		var start_x = GUI_VIEW_DECK_XOFFSET + card_wsep + card_w * 0.5;

		sorted_list = sortCards(global.current_deck);

		for (var i = 0; i < ds_list_size(sorted_list); i++)
		{
			var _card = sorted_list[| i];

			var col = i mod cards_per_row;
			var row = i div cards_per_row;

			var xx = start_x + col * (card_w + card_wsep);
			var yy = GUI_VIEW_DECK_YOFFSET + card_h * 0.5
				+ row * (card_h + GUI_VIEW_DECK_SEP);
				
			_card.x = xx
			_card.y = yy + VIEW_HEIGHT


			_card.move_to(xx, yy, CARD_STATE.SHOWING_DECK, 10);

			_card.current_width  = card_w;
			_card.current_height = card_h;
		}
	}
}