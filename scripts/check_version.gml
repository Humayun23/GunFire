///check_version(string)
str=string(argument0)+".";

str_pos = 1;
num = 0;
str_temp = "";

while(str_pos < string_length(str))
    {

    while (string_char_at(str, str_pos) != ".")
        {
        str_temp += string_char_at(str, str_pos);
        str_pos += 1;
        }
    val[num] = string(str_temp);
    str_pos += 1;
    num += 1;
    str_temp = "";
    }
if (num<2) return -1;

_v=real(val[1]);
_t=real(val[0]);
show_debug_message(_v);
show_debug_message(_t);

if (_t>GVersion_Type)
{
return true;
}
else
if (_v>GVersion){
return true;}
else{
return false;
}
