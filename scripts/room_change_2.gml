// Remember to round theese
display_w = round(display_get_width());
display_h = round(display_get_height());
wview=320*5;
hview=480*5;
views_aspect_ratio = wview / hview;
display_aspect_ratio = display_w / display_h;
// If we have to enlarge vertically
    
    hview = wview / display_aspect_ratio;
    hport = wview / display_aspect_ratio;
    wview = hview / display_aspect_ratio;
    wport = hview / display_aspect_ratio;
show_debug_message(string(wview)+","+string(hview)+"|"+string(wport)+","+string(hport));
room_set_view(rm_temp,0,true,0,0,wview,hview,0,0,wport,hport,(wport/2)-30,(hport/2)-30,-1,-1,obj_Player);
window_set_size(wport,hport);