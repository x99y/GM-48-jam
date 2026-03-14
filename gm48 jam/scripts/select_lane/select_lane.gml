
function select_lane(){

    var mx = mouse_x;
    var my = mouse_y;

    if (my < LANE_TOP_Y || my > LANE_BOT_Y) return -1;

    if (mx >= LANE_ONE_XOFFSET[0]   && mx <= LANE_ONE_XOFFSET[1])   return 0;
    if (mx >= LANE_TWO_XOFFSET[0]   && mx <= LANE_TWO_XOFFSET[1])   return 1;
    if (mx >= LANE_THREE_XOFFSET[0] && mx <= LANE_THREE_XOFFSET[1]) return 2;
    if (mx >= LANE_FOUR_XOFFSET[0]  && mx <= LANE_FOUR_XOFFSET[1])  return 3;

    return -1;

}