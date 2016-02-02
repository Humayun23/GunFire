///log_add(string)
if (os_type==os_android){
file_text_write_string(global._logfile,string(argument0))
file_text_writeln(global._logfile);
}
else show_debug_message("[logs]"+string(argument0));

con_add("[Log] "+string(argument0),c_yellow);

return 0;
