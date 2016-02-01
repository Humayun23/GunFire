buffer=argument[0];

angle = buffer_read(buffer,buffer_s16);
    spd=bullet_speed;
    xx = obj_Player.x;
    yy = obj_Player.y;
    dmg=ItemDat[obj_Player.weaponid,7];
   show_debug_message('angle :'+string(angle));
   createBullet(obj_Player.x,obj_Player.y,spd,angle,dmg,id);