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
	
	var _hitsound = round(random_range(0,7))
	switch _hitsound{
			case 0:
				audio_play_sound(snd_beam,6,0)
			break
			
			case 1:
				audio_play_sound(snd_bite,6,0)
			break
			
			case 2:
				audio_play_sound(snd_enemy1,6,0)
			break
				
			case 3:
				audio_play_sound(snd_enemy2,6,0)
			break
			
			case 4:
				audio_play_sound(snd_explode,6,0)
			break
			
			case 5:
				audio_play_sound(snd_hit,6,0)
			break
			
			case 6:
				audio_play_sound(snd_rifle,6,0)
			break
			
			case 7:
				audio_play_sound(snd_talk,6,0)
			break
	}
	
	_entity.hp -= get_dmg
	
	var _effect_x= (_entity.x/ room_width) * VIEW_WIDTH
	var _effect_y =(_entity.y - 30)/room_height * VIEW_HEIGHT
	
	popup_handler.add(string(-get_dmg),_effect_x , _effect_y, c_red)
	camera_shake(get_dmg, 0.75)
	
}