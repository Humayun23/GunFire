//draw_text_colored(x,y,height,string)
//anything in brackets will change color
//ex: draw_text_colored(32,32,18,"[0]This is ["+string(c_red)+"]red[0].#This is ["+string(c_blue)+"]blue[0].")
var xx, yy, str, str2, pos;
xx=argument0
yy=argument1
str=argument3
pos=1
str2="";
str3=c_black;
while(string_length(str)>0)
{if string_char_at(str,pos)="["
{str2=""
while(string_char_at(str,pos+1)!="]")
{str2+=string_char_at(str,pos+1)
str=string_delete(str,pos+1,1)}
str=string_delete(str,pos,2)
//if you wanted, you could simplify dialogue writing by doing something along the lines of
//if str2="red" str2=c_red
//and so on
switch (str2)
{
case "red"  :str3=c_red; break;
case "blue" :str3=c_blue;break;
case "white":str3=c_white;break;
case "black":str3=c_black;break;
//case "\#":str2="\#"
default :str3 = real(str2);break;
}
draw_set_color(real(str3))
if str2=="\n"
{draw_text(xx,yy,string_copy(str,1,pos-1))
xx=argument0;
yy+=argument2;
//str=string_delete(str,1,pos-1);
pos=1}}
else if string_char_at(str,pos+1)="[" or pos=string_length(str)
{draw_text(xx,yy,string_copy(str,1,pos))
xx+=string_width(string_copy(str,1,pos))
str=string_delete(str,1,pos)
pos=1}
else pos++
}
