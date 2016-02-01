
if (can_shoot==1)
{
var xx = x ;
var yy = y;
audio_play_weapon_sound(ItemDat[weaponid,9]);
if (ItemDat[weaponid,8]=="shotgun")
{
for (no=0;no<=5;no+=1){
dir=round((image_angle+irandom_range(-10,10)));
createBullet(xx,yy,bullet_speed,dir,ItemDat[weaponid,7]+irandom(2),id);
}
}
else
createBullet(xx,yy,bullet_speed,image_angle+irandom_range(-5,5),ItemDat[weaponid,7]+irandom(4),id);

can_shoot=false;
alarm[0]=((room_speed/ItemDat[weaponid,6])/room_speed)*fps;
}