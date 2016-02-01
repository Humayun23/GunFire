_dir=argument0;
globalvar bck_tile,fog_color,fog_density,Last_Map;
Last_Map=argument0;
show_debug_message("Loading map from "+string(argument0));
fog_color=c_black;
fog_density=0;
bck_tile=-1;
global.rm = room_duplicate(rm_temp);
if (file_exists(_dir))
{
globalvar buff;
buff=buffer_load(_dir);
header= buffer_read(buff,buffer_string);
if (header!="#GunFireMap#") {show_message("Map is not valid!") buffer_delete(buff) return -1;}
version = buffer_read(buff,buffer_u8);
code = buffer_read(buff,buffer_u16);
if (version==105)
{
map_w=buffer_read(buff,buffer_u16);
map_h=buffer_read(buff,buffer_u16);
}
ct_x=buffer_read(buff,buffer_s16);
ct_y=buffer_read(buff,buffer_s16);
t_x=buffer_read(buff,buffer_s16);
t_y=buffer_read(buff,buffer_s16);
room_instance_add(global.rm,ct_x,ct_y,o_CTSpawn);
room_instance_add(global.rm,t_x,t_y,o_TSpawn);

fog_density = buffer_read(buff,buffer_u16)/10;
fog_color = buffer_read(buff,buffer_s16);

tile_file=buffer_read(buff,buffer_string);
tileinf=buffer_read(buff,buffer_string);

if (file_exists(global.g_dir+"gfx/tiles/"+tile_file))
  {
  bck_tile=background_add(global.g_dir+"gfx/tiles/"+tile_file,0,0);
  }
  else
  {
  show_message("Tile FIle not exists:"+string(global.g_dir+"gfx/tiles/"+tile_file));
  buffer_delete(buff);
  return -1;
  }

t_light=buffer_read(buff,buffer_u16);

for (i=1;i<=t_light;i++)
{
xx=buffer_read(buff,buffer_s16);
yy=buffer_read(buff,buffer_s16);
room_instance_add(global.rm,xx,yy,oStaticLight);
}

t_tiles=buffer_read(buff,buffer_u32);

for (i=1;i<=t_tiles;i++)
{
left=buffer_read(buff,buffer_u16);
top =buffer_read(buff,buffer_u16);
dpth = buffer_read(buff,buffer_s16);
xx= buffer_read(buff,buffer_u16);
yy= buffer_read(buff,buffer_u16);

room_tile_add(global.rm,bck_tile,left,top,32,32,xx,yy,dpth);
}
buffer_delete(buff);
//room_change(rm_temp,obj_Player);
room_goto(global.rm);
}
