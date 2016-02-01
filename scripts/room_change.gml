///room_change(room,object_to_follow)
// Usage: When changing to another room, call this to set the view before entering the room. 
// Examples:
// Go to "room_1" and follow "obj_player": room_change(room_1, obj_player); 
// Go to "room_1" and follow no object: room_change(room_1, -1); 

global.dw=display_get_width();
global.dh=display_get_height();
//global.dw=640;
//global.dh=480;
var use = 0;
if (use==0){
global.height=320*1.5;
global.width=480*1.5;
}else
if (use==1){
global.height=320;
global.width=480;
}else
if (use==2){
global.width=display_get_width();
global.height=display_get_height();
}
show_debug_message(string(global.width)+"|"+string(global.height)+","+string(global.dw)+"|"+string(global.dh))
room_set_view(argument0,0,1,0,0,global.width,global.height,0,0,global.dw,global.dh,global.width/2,global.height/2,-1,-1,argument1);
window_set_size(global.dw,global.dh);

//room_goto(argument0);
