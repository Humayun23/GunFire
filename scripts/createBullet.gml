///createBullet(x,y,speed,direction,damage,shooter)
var xx = argument[0];
var yy = argument[1];
var spd = argument[2];
var dir = argument[3];
var dmg = argument[4];
var shooter = argument[5];
var team =  shooter.team;
var angle = shooter.image_angle;
var shootername=shooter.name;
var wp_id=shooter.weaponid;

/*if !(ItemDat[weaponid,8]=="blade"){
var i=instance_create(xx+lengthdir_x(_itemLength[wp_id],angle),yy+lengthdir_y(_itemLength[wp_id],angle),obj_flash);
if (instance_exists(i))
i.image_angle=angle;;
//i2=instance_create(xx,yy,obj_largeflash);
//i2.image_angle=angle;
}*/
var i=instance_create(xx,yy,obj_Bullet);
i.speed=spd;
i.direction=dir;
i.team=team;
i.shooter=shooter;
i.damage=dmg;
i.shootername=shootername;
//if ((ItemDat[weaponid,8]=="blade"))
//{
//with (i) alarm[0]=10;
//}
return i;
