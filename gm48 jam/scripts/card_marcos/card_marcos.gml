enum SELECTION_FINGER_TYPE{
	ALL,
	BIOLOGICAL,
	MECHANICAL,
	DESTROYED
}

enum SELECTION_TYPE{
	FINGER,
	LANE
}

enum LANE_SELECTION{
	SELF, //hit in front of player
	ANY, //hit any lane
	SIDE, //hit a lane in front of the player and one to the side
	NOT_SELF_SIDE, //hit a lane in front of the player and one to the side
	NOT_SELF // any that are not in front of the player
}

enum CARD_STATE{
	IDLE,
	PLAY
}


#macro FINGER_SELECTION_ARRAY_LENGTH 3
#macro LANE_SELECTION_ARRAY_LENGTH 3

