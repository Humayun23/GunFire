with obj_Player{
if (reloading==true ) exit;
if (can_shoot==1) and ds_grid_get(weapondata,ItemDat[weaponid,10],2)>0{

var xx=(x);
var yy=(y);
var spd=bullet_speed;
ds_grid_set(weapondata,ItemDat[weaponid,10],2,ds_grid_get(weapondata,ItemDat[weaponid,10],2)-1);
var damage=ItemDat[weaponid,7];

if (ItemDat[weaponid,8]=="shotgun"){
for (no=0;no<=5;no+=1){
var dir=((image_angle+irandom_range(-10,10)));
if (instance_exists(obj_Client))
{
with (obj_Client)
  {
  buffer_seek(Buffer,buffer_seek_start,0);
  buffer_write(Buffer,buffer_u8,4);
  buffer_write(Buffer,buffer_s32,(xx));
  buffer_write(Buffer,buffer_s32,(yy));
  buffer_write(Buffer,buffer_s32,(spd));
  buffer_write(Buffer,buffer_s32,(dir));
  buffer_write(Buffer,buffer_s32,(damage));
  buffer_write(Buffer,buffer_s32,obj_Player.id);
  network_send_packet(Socket,Buffer,buffer_tell(Buffer));

  }
}
else{
createBullet(x,y,spd,dir,damage,id);
}

}
}
else
{
var dir=((image_angle-5+irandom(5)))

if (instance_exists(obj_Client))
{
with (obj_Client)
  {
  buffer_seek(Buffer,buffer_seek_start,0);
  buffer_write(Buffer,buffer_u8,4);
  buffer_write(Buffer,buffer_s32,(xx));
  buffer_write(Buffer,buffer_s32,(yy));
  buffer_write(Buffer,buffer_s32,(spd));
  buffer_write(Buffer,buffer_s32,(dir));
  buffer_write(Buffer,buffer_s32,(damage));
  buffer_write(Buffer,buffer_s32,obj_Player.id);
  network_send_packet(Socket,Buffer,buffer_tell(Buffer));
  }
}
else
{
createBullet(xx,yy,spd,dir,damage,id);}
}

can_shoot=0;

alarm[0]=(room_speed/ItemDat[weaponid,6])
audio_play_weapon_sound(ItemDat[weaponid,9]);
image_angle+=random_range(-3,3);
x=x+lengthdir_x(-1,image_angle)
y=y+lengthdir_y(-1,image_angle);
}else {
if ( ds_grid_get(weapondata,ItemDat[weaponid,10],2)<=0){
alarm[1]=1;
reloading=true;
}
}
}
