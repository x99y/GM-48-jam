function player_viewing_deck(){
	var wheel = mouse_wheel_down() - mouse_wheel_up();
	var cards_per_row = DECK_DISPLAYED_CARDS_PER_ROW;
	var card_aspect = GUI_CARD_HEIGHT / GUI_CARD_WIDTH;
	var deck_w = GUI_VIEW_DECK_WIDTH;
	var card_wsep = deck_w * 0.02;
	var card_w = (deck_w - card_wsep * (cards_per_row + 1)) / cards_per_row;
	var card_h = card_w * card_aspect;
	var sep = GUI_VIEW_DECK_SEP;

	// Total number of rows
	var total_rows = ceil(ds_list_size(global.current_deck) / cards_per_row);

	// Total pixel height of deck
	var total_height = total_rows * (card_h + sep);

	// Allow bottom row to reach halfway up the viewport
	var overscroll = GUI_VIEW_DECK_HEIGHT * 0.25; 

	var max_scroll = max(0, total_height - GUI_VIEW_DECK_HEIGHT + overscroll);

	// Scroll per wheel notch (one row)
	var scroll_step = (card_h + sep) * 0.25;

	if (wheel != 0)
	{
	    deck_pos_to = clamp(deck_pos_to + scroll_step * wheel, 0, max_scroll);
	}

	// Smooth scroll
	oCardRenderer.deck_pos = deck_pos_to//lerp(oCardRenderer.deck_pos, deck_pos_to, 0.25);
	
	//Check what we are hovering over
	with oCardRenderer{
		var _mouse_x = device_mouse_x_to_gui(0)
		var _mouse_y = device_mouse_y_to_gui(0)
	
		var _deck_size = ds_list_size(sorted_list);
	
		// Calculate top row based on current scroll
		var _top_row = deck_pos div (GUI_VIEW_DECK_SEP + GUI_CARD_HEIGHT);

		// Horizontal spacing between cards
		var _xsep = (GUI_VIEW_DECK_WIDTH - (GUI_CARD_WIDTH * DECK_DISPLAYED_CARDS_PER_ROW)) / DECK_DISPLAYED_CARDS_PER_ROW;

		// Calculate column and row under mouse
		var _xPos = clamp((_mouse_x - GUI_VIEW_DECK_XOFFSET) div (GUI_CARD_WIDTH + _xsep), 0, DECK_DISPLAYED_CARDS_PER_ROW - 1);
		var _yPos = clamp((_mouse_y - GUI_VIEW_DECK_YOFFSET + deck_pos) div (GUI_CARD_HEIGHT + GUI_VIEW_DECK_SEP), 0, ceil(_deck_size / DECK_DISPLAYED_CARDS_PER_ROW) - 1);

		// Convert to deck index
		var _closest_card = _xPos + _yPos * DECK_DISPLAYED_CARDS_PER_ROW;

		// Hover detection
		if (_closest_card < _deck_size) {
		    var _cur_card = sorted_list[| _closest_card];

		    if (_cur_card.point_colliding(_mouse_x, _mouse_y)) {
		        if (_cur_card.state != CARD_STATE.MOVE) {
		            prev_card_index = _closest_card;
		            other.selected_card = _cur_card;
		            _cur_card.switch_state(CARD_STATE.HOVER);

		            // Handle click
		            if (mouse_check_button_pressed(mb_left)) {
		                other.switch_state(displaying_selected_card);
		            }
		        }
		    } else {
		        other.selected_card = noone;
		    }
		} else {
		    other.selected_card = noone;
		}
	}
	
	if keyboard_check_pressed(ord("D") or keyboard_check_pressed(vk_escape)){
		switch_state(player_on_board)
		
		
		hide_deck()
	}	
	
}