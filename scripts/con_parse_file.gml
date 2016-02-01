///con_parse_file(dir)
if (file_exists(argument0))
{
var line=0;
var file = file_text_open_read(argument0);
var str="";
while (!file_text_eof(file))
{
line++;
txt=file_text_read_string(file);
if (string_count(" ",txt)>0)
if (string_char_at(txt,1)!="#")
{
str=txt+" ";
str_pos = 1;
num = 0;
str_temp = "";

while(str_pos < string_length(str))
    {
    
    while (string_char_at(str, str_pos) != " ")
        {
        str_temp += string_char_at(str, str_pos);
        str_pos += 1;
        }
    val[num] = string(str_temp);
    str_pos += 1;
    num += 1;
    str_temp = "";
    }
val[0]=string_lower(val[0]);
show_debug_message(val[0]);
if (ds_list_find_index(global.con_com_list,val[0])==-1)
   {
   con_add("Unknown command :"+string(val[0])+" at line:"+string(line),c_red);
   }
   else
   con_parse(txt);

}
file_text_readln(file);
}
file_text_close(file);
}
else
return -1;