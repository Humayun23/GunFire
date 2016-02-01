switch (os_type)
{
case os_win32 : _dir = working_directory+"CS2D"; text="OS Windows Found";break;
case os_android : _dir = "/storage/sdcard0/CS2D"; text="Android OS Found"; break;
case os_browser :  _dir = working_directory+"CS2D"; text="OS Browser Found";break;
}
global.g_dir=_dir+"/";
if (directory_exists(_dir))
{
global._logfile=file_text_open_write(global.g_dir+"sys/logs.txt");
log_add("Directory exists: "+string(global.g_dir))
}

var always_load_new=1; //for test only!
show_debug_message(global.g_dir);

if (always_load_new==0){
if (directory_exists(_dir))
{
if (file_exists(_dir+"/sys/gameversion.txt"))
{
var f =file_text_open_read(_dir+"/sys/gameversion.txt")

ver = file_text_read_real(f);
file_text_close(f);
if (ver==VERSION){
log_add("Version:"+string(ver)+" check complete, data checking complete loading menu...");
room_goto_next();
return 0;
}
}
}
}
//if (directory_exists(_dir))
//{
//directory_destroy(_dir); //delete old dir;
//}
var time=current_time;
directory_create(_dir);
global._logfile=file_text_open_write(global.g_dir+"sys/logs.txt");
if (always_load_new>=1)
log_add("[Waring]Value of always_load >=1|"+string(always_load_new));
log_add("Directory not exists: "+string(global.g_dir))
log_add("Copying files to new directory...")
directory_create(_dir+"/gfx");
directory_create(_dir+"/gfx/weapons");
directory_create(_dir+"/gfx/tiles");
directory_create(_dir+"/maps");
directory_create(_dir+"/sys");
file=file_text_open_read(working_directory+"files.txt")
if (file<=-1)
{
log_add("[ERROR]files.txt not found!");
show_message("File not found files.txt!")
game_end();
return -1;
}
n=0;
line=''
log_add("Text in file.txt:")
while (!file_text_eof(file))
{
s=file_text_read_string(file);
//if (string_char_at(s,1)=="") break;
if not(string_char_at(s,1)=="#" and string_char_at(s,2)=="#"){
log_add(string(n+1)+"-"+string(s));
line[n]=s;
n++;
}
else
log_add("[#] Found");

file_text_readln(file);
show_debug_message(line[n-1]);
}
log_add("All file readed!");
file_text_close(file);

log_add("Copying files...");
for (i=0;i<n;i++)
{
log_add("Reading line :"+string(line[i]));
text="Loading files...";
show_debug_message(line[i]);
str=line[i]+"|"
str_pos = 1;
num = 0;
str_temp = "";

while(str_pos < string_length(str))
    {
    
    while (string_char_at(str, str_pos) != "|")
        {
        str_temp += string_char_at(str, str_pos);
        str_pos += 1;
        }
    val[num] = string(str_temp);
    str_pos += 1;
    num += 1;
    str_temp = "";
    }
    log_add("Checking file:"+string(val[0]));
    if (file_exists(working_directory+val[0]))
    {
    log_add("Checking directory:"+string(_dir+"/"+val[1]));
    if (!directory_exists(_dir+"/"+val[1]))
      {
      log_add("Directory not found creating new...");
      directory_create(_dir+"/"+val[1]);
      }
    log_add("[Copying] Copying file "+string(val[0])+" to " +string(_dir+"/"+val[1]+val[0]));
    text="Copying file :"+string(val[0])+" to "+string(_dir+"/"+val[1]+val[0]);
    file_from=working_directory+val[0];
    file_to_copy=_dir+"/"+val[1]+val[0];
     
    
    show_debug_message(text);
    copy=file_copy(file_from,file_to_copy);
    log_add("Copying return value:"+string(copy));
    if (copy<0)
    log_add("[Error]:["+string(copy)+"] is return value, copying failed!");
     text="Status:"+string(copy);
     loaded+=5;
     show_debug_message("Copying status["+string(val[0])+"]: "+string(copy));
    }

}
log_add("Writing OS info!");
f=file_text_open_write(global.g_dir+"sys/osinfo.txt");
os_map = os_get_info();
if os_map != -1
   {
   var size, key, i;
   size = ds_map_size(os_map);
   key = ds_map_find_first(os_map);
   for (i = 0; i < size - 1; i++;)
      {
      map_data[i] = ds_map_find_value(os_map, key);
      file_text_write_string(f,map_data[i]);
      file_text_writeln(f);
      key = ds_map_find_next(os_map, key);
      }
   ds_map_destroy(os_map);
   }
file_text_close(f);
log_add("## Done loading first time");
log_add("Time to complete:"+string(current_time-time)+"ms");
text="All done..."
text="Checking load.png";
log_add("Checking load.png to finalize...");
if (file_exists(_dir+"/gfx/load.png"))
{
log_add("File found loading menu");
text="File found loading menu";
room_goto_next();
return true;
}else {
log_add("[Error]-File not found! load.png");
text="Copying error or unkown error (file not exists "+string(_dir+"/gfx/load.png")+")";
show_message("Copying error or unkown error!") game_end(); return -1;
}
