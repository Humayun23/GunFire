//global.__map_to_load=argument0;
//room_goto(rm_map_loading);
_dir=argument0;

globalvar bck_tile,fog_color,fog_density;
show_debug_message("Loading map from "+string(argument0));
con_add("Loading map :"+string(filename_name(argument0)),c_yellow);
fog_color=c_black;
fog_density=0;
bck_tile=-1;
global.rm = rm_play
//if (room==rm_temp)
//{
//with (o_Entities) instance_destroy();
//tile_layer_delete(-100);
//tile_layer_delete(-50);
//}
if (file_exists(_dir))
{
globalvar buff;
buff=buffer_load(_dir);
header= buffer_read(buff,buffer_string);
if (header!="#GunFireMap#") {show_message("Map is not valid!") buffer_delete(buff) return -1;}
//first code
version = buffer_read(buff,buffer_u16);
show_debug_message(version);
if (version<110 or version>1000) //if old map -not recommanded"
{ 
show_debug_message("Old Map!");
buffer_delete(buff);
map_load_old(_dir);
return -1;
exit;
}

code = buffer_read(buff,buffer_u16);
for (i=1;i<=8;i++)
buffer_read(buff,buffer_u16);
//----
//Map data 10
rm_width=buffer_read(buff,buffer_u16);
rm_height=buffer_read(buff,buffer_u16);
room_set_width(global.rm,rm_width);
room_set_height(global.rm,rm_height);

for (i=1;i<=8;i++) buffer_read(buff,buffer_u16);

tile_file=buffer_read(buff,buffer_string);
tileinf=buffer_read(buff,buffer_string);
for (i=1;i<=13;i++) buffer_read(buff,buffer_string);

//other data
fog_density = buffer_read(buff,buffer_s16)/10;
//fog_density=0.5;
fog_color = buffer_read(buff,buffer_s16);
for (i=1;i<=8;i++) buffer_read(buff,buffer_s16);

//entities
t_entities=buffer_read(buff,buffer_u16)
show_debug_message("Entities:"+string(t_entities));
for (i=1;i<=t_entities;i++)
{
type=buffer_read(buff,buffer_u8);
xx=buffer_read(buff,buffer_s16);
yy=buffer_read(buff,buffer_s16);
var dat;
for (a=1;a<=7;a++){
dat[a]=buffer_read(buff,buffer_s16);
}

//show_debug_message("type:"+string(type));
switch (type)
  {
  case 0:room_instance_add(global.rm,xx,yy,o_CTSpawn);break;  //if ct spawn
  case 1:room_instance_add(global.rm,xx,yy,o_TSpawn);break;
  case 2:room_instance_add(global.rm,xx,yy,oStaticLight);break;
  case 3:room_instance_add(global.rm,xx,yy,obj_room_shadow);break;
 // case 4:var k=room_instance_add(global.rm,xx,yy,obj_whether); with k type=dat[1];break;
  }
}




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


t_tiles=buffer_read(buff,buffer_u32);

for (i=1;i<=t_tiles;i++)
{
left=buffer_read(buff,buffer_s16);
top =buffer_read(buff,buffer_s16);
dpth = buffer_read(buff,buffer_s16);
xx= buffer_read(buff,buffer_s16);
yy= buffer_read(buff,buffer_s16);
for (a=1;a<=5;a++) buffer_read(buff,buffer_s16);
room_tile_add(global.rm,bck_tile,left,top,32,32,xx,yy,dpth);
}
buffer_delete(buff);
//room_change(global.rm,obj_Player);
room_goto(global.rm);
}
