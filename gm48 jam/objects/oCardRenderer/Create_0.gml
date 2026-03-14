init_card_database()

//global.base_card_sprites;
_length = array_length(card_data)
global.base_cards = array_create(_length, undefined)

//If i want to preload all cards, do it here
for (var i = 0; i < _length; i++)
{
	create_card(i)
}

current_card = 0