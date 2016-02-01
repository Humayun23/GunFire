///map_varify_map(map_dir)
if (file_exists(argument0)){
var buffer=buffer_load(argument0);
var header = buffer_read(buffer,buffer_string);
var version = buffer_read(buffer,buffer_u16);
buffer_delete(buffer);
if (header="#GunFireMap#" and version==map_supporting_code)
   {
   return 1;
   }
   else
if (header="#GunFireMap#" and (version<110 or version>1000))
   {
   return 0;
   }
   else
if (header!="#GunFireMap#" and version!=110)
   {
   return -1;
   }
   else
   return -3;
   }
   else
   return -2; 