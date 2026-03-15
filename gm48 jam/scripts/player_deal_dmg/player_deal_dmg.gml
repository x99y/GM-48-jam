function player_deal_dmg(_entity, _type, _base_dmg, _casting_from = noone){
	var get_dmg;
	switch _type{
		case DMG_TYPE.CRUSH: 
			get_dmg = deal_crush_dmg(_base_dmg) 
		break
		case DMG_TYPE.BLUNT:
			get_dmg = deal_blunt_dmg(_base_dmg)
		break
	}
	
	_entity.hp -= get_dmg
	
	var _effect_x= (_entity.x/ room_width) * VIEW_WIDTH
	var _effect_y =(_entity.y - 30)/room_height * VIEW_HEIGHT
	
	popup_handler.add(string(-get_dmg),_effect_x , _effect_y, c_red)
	camera_shake(get_dmg, 0.75)
	
}