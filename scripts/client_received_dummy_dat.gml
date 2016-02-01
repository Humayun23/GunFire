buffer=argument[0];
time=current_time;
var socket =buffer_read(buffer,buffer_u8);
var xx = buffer_read( buffer , buffer_u16 );
var yy = buffer_read( buffer , buffer_u16 );
var dir = buffer_read( buffer , buffer_u16 );
var angle = buffer_read( buffer , buffer_u16 );
var wp_id = buffer_read (buffer, buffer_u8 );
var ft_index = buffer_read(buffer,buffer_u8);
var _hp = buffer_read(buffer,buffer_u16);
show_debug_message("Dummy :"+string(socket)+" data :"+string(xx)+","+string(yy));
for (i=0;i<ds_list_size(DummiesList);i++)
    {
    inst=ds_list_find_value(DummiesList,i);
    if instance_exists(inst)
    {
    if (socket==inst.socket)
              {
              inst.x=xx;
              inst.y=yy;
              inst.image_angle=angle;
              inst.direction=dir;
              inst.weaponid=wp_id;
              inst.foot_index=ft_index/10;
              inst.hp=_hp/10;
              break;
              }
           }
        }