function init_card_database(){
	//not a good method of storing data but i cant be bothered using .json since idk how gamemaker handles it
	card_data[0] = {
		name : "Empty card_data", //name
		desc : "Empty play description", 
		selection_finger_type : SELECTION_FINGER_TYPE.ALL,
		selection_finger_number : 1, //one by default
		
		play_selection : [SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.ALL],1],
		
		lane_selection : LANE_SELECTION.SELF,
		play_script : undefined, //play effect
	}
	
	card_data[1] = {
		name : "Punch", //name
		desc : "Hits any enemy in front of you", 
		selection_finger_type : SELECTION_FINGER_TYPE.ALL,
		selection_finger_number : 1, //one by default
		
		play_selection :	[
								[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.ALL],1],
								[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.ALL],1]
							],
		
		lane_selection : LANE_SELECTION.SELF,
		play_script : undefined, //play effect
	}
	
	
	card_data[2] = {
		name : "Feint", //name
		desc : "Hits for {dex} and lets you move to any lane to the side", 
		
		variables: ["range=player.spd+2", "dex=3"], //Not required
		
		
		
		selection_finger_type : SELECTION_FINGER_TYPE.BIOLOGICAL,
		selection_finger_number : 1, //one by default
		lane_selection : LANE_SELECTION.SELF,
		play_script : undefined, //play effect
	}
}