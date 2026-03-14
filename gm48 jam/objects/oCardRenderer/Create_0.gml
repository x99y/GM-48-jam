init_card_database()
init_keyword_database()
init_player_stats_database()

//global.base_card_sprites;
_length = array_length(card_data)
global.base_cards = array_create(_length, undefined)

//Deck viewing vars
deck_shown = false
sorted_list = ds_list_create()

deck_pos = 0
last_pos = deck_pos

//If i want to preload all cards, do it here
for (var i = 0; i < _length; i++)
{
	create_card(i)
}

