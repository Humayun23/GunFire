///inf_read_string(file,str to find,default)
//Create by humayun 11/14/2015 in production of evacuation
//argument0 =filename
//argument1 = string to find the value of,example:
//playername "King"
//inf_read_string("file.txt",variable-string to read value) 
if (file_exists(argument0)){
var file=file_text_open_read(argument0);
}
else{
return string(argument2);
con_add(">File :"+filename_name(argument0)+" not found!",c_red);
}
if (argument1=="") return string(argument2);

while (!file_text_eof(file))
{
str=file_text_read_string(file)+" ";
file_text_readln(file);
if (string_char_at(str,1))==";" {
str=file_text_read_string(file)+" ";
file_text_readln(file);
};
str=string_replace_all(str,'"',"");

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
    string_replace_all(val[1],'','');
   
    if (val[0]==argument1) { file_text_close(file); 
    for (n=1;n<num;n+=1)
    {
    string_replace_all(val[n]," ","");
    if val[n]!="" return val[n];
     } break;
    }
   
}
file_text_close(file);
return string(argument2);
