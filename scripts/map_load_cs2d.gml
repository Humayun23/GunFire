argument0=get_open_filename("","");
buffer=buffer_load(argument0);
globalvar bck_tile,fog_color,fog_density,Last_Map;
Last_Map=argument0;
fog_color=c_white;
fog_density=0;
header=buffer_read(buffer,buffer_string);
scroll=buffer_read(buffer,buffer_u8);
modifier=buffer_read(buffer,buffer_u8);

for (i=1;i<=8;i++)
{
buffer_read(buffer,buffer_u8);
}

for (i=1;i<=10;i++)
{
buffer_read(buffer,buffer_s32);
}

for (i=1;i<=10;i++)
{
buffer_read(buffer,buffer_string);
}

uk=buffer_read(buffer,buffer_string);
tilename=buffer_read(buffer,buffer_string);
bck_tile=background_add(global.g_dir+"gfx/tiles/dust.png",0,0);
tiles=buffer_read(buffer,buffer_u8);
map_xsize=buffer_read(buffer,buffer_s32);
map_ysize=buffer_read(buffer,buffer_s32);
bckname=buffer_read(buffer,buffer_string);
scroll_x=buffer_read(buffer,buffer_s32);
scroll_y=buffer_read(buffer,buffer_s32);
r=buffer_read(buffer,buffer_u8);
g=buffer_read(buffer,buffer_u8);
b=buffer_read(buffer,buffer_u8);

show_debug_message(string(map_xsize)+"|"+string(map_ysize))
header2=buffer_read(buffer,buffer_string);
room_set_width(rm_temp,map_xsize*32);
room_set_height(rm_temp,map_ysize*32);

for (i=0;i<=tiles;i++)
{
buffer_read(buffer,buffer_u8);
}
for (xx=0;xx<=map_xsize;xx++)
for (yy=0;yy<=map_xsize;yy++)
{
idd=buffer_read(buffer,buffer_u8);
show_debug_message(idd);

room_tile_draw(idd-1,xx*32,yy*32,bck_tile,1,rm_temp)
}

room_instance_add(rm_temp,0,0,o_CTSpawn);
room_instance_add(rm_temp,100,100,o_TSpawn);
buffer_delete(buffer);
room_goto(rm_temp);