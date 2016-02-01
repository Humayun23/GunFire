buffer=argument[0];

var  sck = buffer_read(buffer,buffer_u8);
var  ii=instance_create(10,10,oDummy);
   
ii.socket=sck;
ds_list_add(DummiesList,ii);

show_debug_message("New player :"+string(sck));