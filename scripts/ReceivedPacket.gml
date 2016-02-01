///ReceivedPacket(buffer id)
      var buffer = argument[ 0 ];
   var msgid = buffer_read( buffer , buffer_u8 );
   
   switch( msgid ) {
      case 1:
      var _socket = buffer_read(buffer,buffer_u8);
      var inst = instance_create(0,0,obj_Dummie);
      show_debug_message("Creating dummie : "+string(_socket));
      inst.socket = _socket;
      break;
      
      
      case 2: //set dummy data
      var _socket,xx,yy,angle,spr,index,wpid,findex;
     _socket = buffer_read(buffer,buffer_u8);
      xx=buffer_read(buffer,buffer_s32);
      yy=buffer_read(buffer,buffer_s32);
      angle=buffer_read(buffer,buffer_s32);
      spr=buffer_read(buffer,buffer_s32);
      index=buffer_read(buffer,buffer_s32);
      wpid=buffer_read(buffer,buffer_s32);
      findex=buffer_read(buffer,buffer_s32);
      
      show_debug_message("dummy data " +string(_socket));
      with (obj_Dummie)
      {
      if (socket==_socket)
         {
         x=xx;
         y=yy;
         image_angle = angle;
         sprite_index=spr;
         image_index=index;
         weaponid=wpid;
         foot_index=findex;
         }
      };
      break;
      case 3:
    var _map = buffer_read(buffer,buffer_string);
    if file_exists(global.g_dir+"maps\"+string(_map)) and global.lastmap!=(global.g_dir+"maps\"+string(_map))
      {
      global.lastmap=global.g_dir+"maps\"+string(_map);
      map_load(global.g_dir+"maps\"+string(_map));
      };
    break;
    
     case 4: 
     var _socket,xx,yy,spd,dir,damage,_id;
     _socket=buffer_read(buffer,buffer_u8);
     xx=buffer_read(buffer,buffer_s32);
     yy=buffer_read(buffer,buffer_s32);
     spd=buffer_read(buffer,buffer_s32);
     dir=buffer_read(buffer,buffer_s32);
     damage=buffer_read(buffer,buffer_s32);
     _id=buffer_read(buffer,buffer_s32);
     with (obj_Dummie)
     {
     if (socket==_socket)
     _id=id;
     }
    show_debug_message("ID:"+string(_id));
    createBullet(xx,yy,spd,dir,damage,_id);
    break;
    
    case 6:
    var str = buffer_read(buffer,buffer_string);
    script_addline(str);
    break;
    }
   
