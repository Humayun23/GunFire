buffer=argument[0];

var socket = buffer_read(buffer,buffer_u8);
var dir = buffer_read(buffer,buffer_s16);
   
   for (i=0;i<ds_list_size(DummiesList);i++)
   {
        inst=ds_list_find_value(DummiesList,i);
        if (instance_exists(inst))
        {
         if (socket==inst.socket)
         {
               spd=bullet_speed;
               xx = inst.x + lengthdir_x(_itemLength[inst.weaponid],inst.image_angle);
               yy = inst.y + lengthdir_y(_itemLength[inst.weaponid],inst.image_angle);
               dmg=ItemDat[inst.weaponid,7];

           createBullet(inst.x,inst.y,spd,dir,dmg,inst);
         }
         } 

   }