function setup_camera()
{
    var board_w = room_width;
    var board_h = room_height;

    // margins
    var margin_w = GUI_MAP_MARGIN;
    var margin_top = GUI_MAP_TOP_MARGIN;
    var margin_bot = GUI_MAP_BOT_MARGIN;

    var total_w = board_w + margin_w * 2;
    var total_h = board_h + margin_top + margin_bot;

    // required scale to fit board
    var scale_w = total_w / CAMERA_WIDTH_RATIO;
    var scale_h = total_h / CAMERA_HEIGHT_RATIO;

    // smallest scale that fits everything
    var ratio = ceil(max(scale_w, scale_h));

    ratio = clamp(ratio, CAMERA_SMALLEST_FACTOR, VIEW_SIZE_RATIO);

    var cam_w = CAMERA_WIDTH_RATIO * ratio;
    var cam_h = CAMERA_HEIGHT_RATIO * ratio;

    // prevent camera exceeding room
    cam_w = min(cam_w, room_width);
    cam_h = min(cam_h, room_height);

    camera_set_view_size(global.Camera, cam_w, cam_h);

    // calculate margins
    var extra_w = cam_w - total_w;
    var extra_h = cam_h - total_h;

    global.camera_margin_width  = extra_w * 0.5 + margin_w;
    global.camera_margin_height = extra_h + margin_top;

    global.camera_max_width  = cam_w;
    global.camera_max_height = cam_h;

    with (oCamera)
    {
        target_width  = cam_w;
        target_height = cam_h;

        current_width  = cam_w;
        current_height = cam_h;

        x = x_to;
        y = y_to;
    }
}