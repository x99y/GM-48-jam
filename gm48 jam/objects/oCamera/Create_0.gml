enum CAM_STATE{
	UPDATE_SCENE,
	IDLE,
	MOVE,
	ADJUST_SIZE
}

//Init camera and view
global.Camera = camera_create_view(0,0 ,VIEW_HEIGHT,VIEW_WIDTH)
view_enabled = true
view_visible[0] = true
view_set_camera(0, global.Camera)

var _window_w = VIEW_WIDTH
var _window_h = VIEW_HEIGHT

global.camera_max_width = _window_w
global.camera_max_height = _window_h

camera_set_view_size(global.Camera,_window_w,_window_h)

window_set_size(_window_w, _window_h)
surface_resize(application_surface,_window_w, _window_h)
window_set_position(display_get_width() /2 - _window_w /2, display_get_height() /2 - _window_h / 2)

target_width = _window_w
target_height = _window_h

current_width = _window_w
current_height = _window_h

//Other vars
target = noone 

x_to = 0
y_to = 0

lock_to_board  = true

setup_camera()