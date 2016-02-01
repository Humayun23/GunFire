buffer=argument[0];

var msg = buffer_read(buffer,buffer_string);
show_debug_message('msg received!'+string(msg));
script_addline(msg);