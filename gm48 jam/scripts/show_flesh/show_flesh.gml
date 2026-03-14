
function show_flesh(){
	oHandRenderer.move_to(GUI_HAND_SHOWN_X,GUI_HAND_SHOWN_Y,15)
	oHandRenderer.image_speed = 0.5
}


function hide_flesh(){
	oHandRenderer.move_to(GUI_HAND_HIDDEN_X,GUI_HAND_HIDDEN_Y,15)
	oHandRenderer.shake = false
}

function animate(_damage, _position, _idle){
//_damage is the hurt or dead state, _position is rise/fall
//purpose is to detect end of animation loop and swap to next animation in cycle
//_ damage 1 = hurt, 0 = dead; _position 1 = rise, 0 = fall

	//hurt
	if _damage = 1
	{
		if _position = 1
		{
			sprite_f1 = sFinger1Rise;
			sprite_f2 = sFinger2Rise;
			sprite_f3 = sFinger3Rise;
			sprite_f4 = sFinger4Rise;
			sprite_f5 = sFinger5Rise;
			sprite_hand = sHandHRise;
		}
		if _position = 0
		{
			sprite_f1 = sFinger1;
			sprite_f2 = sFinger2;
			sprite_f3 = sFinger3;
			sprite_f4 = sFinger4;
			sprite_f5 = sFinger5;
			sprite_hand = sHand;
		}
	}
	
	//dead
	if _damage = 0
	{
		if _position = 1
		{
			sprite_f1 = sFinger1;
			sprite_f2 = sFinger2;
			sprite_f3 = sFinger3;
			sprite_f4 = sFinger4;
			sprite_f5 = sFinger5;
			sprite_hand = sHand;
		}
		if _position = 0
		{
			sprite_f1 = sFinger1;
			sprite_f2 = sFinger2;
			sprite_f3 = sFinger3;
			sprite_f4 = sFinger4;
			sprite_f5 = sFinger5;
			sprite_hand = sHand;
		}
	}

	if (image_index >= image_number - 1)
	{
		sprite_f1 = sFinger1;
		sprite_f2 = sFinger2;
		sprite_f3 = sFinger3;
		sprite_f4 = sFinger4;
		sprite_f5 = sFinger5;
		sprite_hand = sHand;
		image_speed = 0
	}
	
	
}