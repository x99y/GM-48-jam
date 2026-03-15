function init_card_database(){
	//not a good method of storing data but i cant be bothered using .json since idk how gamemaker handles it
	card_data[0] = {
		name : "Empty card_data", //name
		desc : "Empty play description",
		rarity : RARITY.COMMON,
		selection_finger_type : SELECTION_FINGER_TYPE.ALL, //not all by default
		selection_finger_number : 1, //one by default
		selection_finger_effect : EFFECTS.DESTROY, //Destroy by default
		
		//NOTE the above selection struct is not actually required, it just formats it like below.
		
		play_selection : [
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.DESTROY],
		
		 //PLay selection is not required, but this is the formated selection for fingers
		//					[	Type of selection, [List of what you can select], how many fingers you select at once, what happens when the fingers are selected		]
		// Play selection can have multiple diffrent selection info mation ie we select a finger to destroy and the next is a finger to heal
		// just make sure they are all wrapped in a array (example below)
		//[
		// [Selection array 1],
		// [selection array 2]
		//]
		
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],3,[STATUS_EFFECT.REGEN,2]]
		
		//Sometimes instead of a EFFECT, liek destroy we can give the finger a status effect. You can add more to the enum, they dont do anything yet tho
		//	[status effect, intesity of effeect]
		
		], 
		
		
		//Below is being built ignore for now
		lane_selection : LANE_SELECTION.SELF,
		play_script : undefined, //play effect
	}
	
	card_data[1] = {
		name : "Jawbreaker", //name
		desc : "Hits {str} in front of you, applies {dec} decay to two fingers",
		variables: ["str=player.str+2", "dec= 1"],


		play_selection : 
			[
			[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],2,[STATUS_EFFECT.DECAY,"dec"]],
			[SELECTION_TYPE.LANE,LANE_SELECTION.SELF,1,[LANE_EFFECTS.DMG,DMG_TYPE.BLUNT,"str"]]
			]
	}
	
	//MAKE SURE TO CHANGE THE ID !!!!!!!!!!!!!
	card_data[2] = {
		name : "Feint", //name
		desc : "Hits for {range} and lets you move {dex} lane to the side", 
		//This is an example of using changing vars in the description, if you put the var in curly brakets it will look if there are varibles under the same name in the card
		variables: ["range=player.spd+2", "dex=3"], //Not required
		//You can set them like this. Player.spd is a player stat, you can see them all in __player_stats_data, CAPATALS MATTER!
		
		
		play_selection :[[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],3,[STATUS_EFFECT.REGEN,"range"]], //These vars can also be passed into the selection
						[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.REGEN,"dex"]],	// NOTE you cannot change the ammount selected with them, working on it
						[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,[STATUS_EFFECT.REGEN,2]]],
		

		selection_finger_type : SELECTION_FINGER_TYPE.BIOLOGICAL,
		selection_finger_number : 1, //one by default
		lane_selection : LANE_SELECTION.SELF,
		play_script : undefined, //play effect
	}

	card_data[3] = {
		name : "Destroy", //name
		desc : "testing destroying yo shit", 
	
		play_selection :[
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.DESTROY],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.DESTROY],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.DESTROY],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.MECHANICAL,SELECTION_FINGER_TYPE.BIOLOGICAL],1,EFFECTS.DESTROY],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.DESTROYED],1,EFFECTS.BIO_HEAL],
		[SELECTION_TYPE.FINGER,[SELECTION_FINGER_TYPE.DESTROYED],1,EFFECTS.MECH_HEAL]
		], //These vars can also be passed into the selection

		
		lane_selection : LANE_SELECTION.SELF,
		play_script : undefined, //play effect
	}
	
	card_data[4] = {
		name : "move right", //name
		desc : "testing lane selection", 
		variables: ["dex=1"],
		
		
		play_selection :[ 
		[SELECTION_TYPE.LANE,LANE_SELECTION.NOT_SELF,1,LANE_EFFECTS.MOVE],
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,1,LANE_EFFECTS.SHOVE_RIGHT],
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,1,LANE_EFFECTS.SHOVE_RIGHT],
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,"dex",LANE_EFFECTS.SHOVE_RIGHT], // DONT DO MORE THAN 1 MOVE !
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,1,LANE_EFFECTS.MOVE]
		], 

		play_script : undefined, //play effect
	}
	
	card_data[5] = {
		name : "move left", //name
		desc : "testing lane selection", 
		variables: ["dex=1"],
		
		
		play_selection :[ 
		[SELECTION_TYPE.LANE,LANE_SELECTION.NOT_SELF_SIDE,1,LANE_EFFECTS.MOVE],
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,1,LANE_EFFECTS.SHOVE_LEFT],
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,1,LANE_EFFECTS.SHOVE_LEFT],
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,"dex",LANE_EFFECTS.SHOVE_LEFT], // DONT DO MORE THAN 1 MOVE !
		[SELECTION_TYPE.LANE,LANE_SELECTION.ANY,1,LANE_EFFECTS.MOVE]
		], 

		play_script : undefined, //play effect
	}

}