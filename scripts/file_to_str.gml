var f = file_text_open_read(argument0);
var str = "";
while (!file_text_eof(f)) {
   str+= file_text_read_string(f) + chr(13)+chr(10);
  file_text_readln(f);
}
file_text_close(f);
show_debug_message(str);
return str;
