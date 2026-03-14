
function show_flesh(){
	oHandRenderer.move_to(GUI_HAND_SHOWN_X,GUI_HAND_SHOWN_Y,15)
}


function hide_flesh(){
	oHandRenderer.move_to(GUI_HAND_HIDDEN_X,GUI_HAND_HIDDEN_Y,15)
	oHandRenderer.shake = false
}