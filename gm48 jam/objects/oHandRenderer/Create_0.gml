randomize()
image_speed = 0
//assign sprites? feel free to clean this up if its messy. draw gui hates frames

depth = -999

sprite_f1 = sFinger1Rise;
sprite_f2 = sFinger2Rise;
sprite_f3 = sFinger3Rise;
sprite_f4 = sFinger4Rise;
sprite_f5 = sFinger5Rise;
sprite_hand = sHandRise;

sprite_frame = 0;
sprite_number = 22;

//init fingers
global.player_fingers = array_create(5)

global.player_fingers[0]= new finger(sprite_f1,0,0) 
global.player_fingers[1]= new finger(sprite_f2,0,0) 
global.player_fingers[2]= new finger(sprite_f3,0,0) 
global.player_fingers[3]= new finger(sprite_f4,0,0) 
global.player_fingers[4]= new finger(sprite_f5,0,0) 




x = GUI_HAND_HIDDEN_X
y = GUI_HAND_HIDDEN_Y

xx = 0
yy = 0

x_start = x
y_start = y

x_to = x_start
y_to = y_start

moving = false

selected_finger = noone

//scared
shake_timer = 0
shake_dest_x = 0
shake_dest_y = 0
start_shake_x =0
start_shake_y =0
shake = false

//sprite_get_width(sHand)
base_width = sprite_get_width(sHand)
base_height = sprite_get_height(sHand)

width = base_width
height = base_height

x_scale = GUI_HAND_WIDTH/base_width
y_scale = GUI_HAND_HEIGHT/base_height
x_scale_start = x_scale
y_scale_start = y_scale
x_scale_dest = x_scale
y_scale_dest = y_scale

update_finger_pos()

function move_to(_x,_y,_time_to = 30, _new_scale = noone){
	
	//_new_scale can either be: 
	// - noone for no change
	// - one value for the same x and y scale _new_scale = scale
	// - two values for x and y scale _new_scale = [x_scale , y_scale]
	moving = true
	
	x_start = x
	y_start = y

	x_to =_x
	y_to =_y

	time = 0
	time_to_pos = _time_to
	
	if _new_scale = noone {return}
	
	
	x_scale_start = x_scale
	y_scale_start = y_scale

	if is_array(_new_scale){
		x_scale_dest = _new_scale[0]
		y_scale_dest = _new_scale[1]
	}else{
		x_scale_dest = _new_scale
		y_scale_dest = _new_scale	
	}
	
}

function mouse_over(){
	var _mx = device_mouse_x_to_gui(0)
	var _my = device_mouse_y_to_gui(0) 
	var desired_w = base_width*x_scale_dest / 2
	var desired_h = base_height*y_scale_dest / 2
	return point_in_rectangle(_mx,_my,x - desired_w, y - desired_h,x + desired_w + base_icon_width*x_scale_dest, y + desired_h)
}


