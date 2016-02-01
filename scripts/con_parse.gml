///con_parse(string)
//con_add(argument0,c_white);
str=string(argument0)+" ";
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
switch (val[0])
{
case "message":if (con_arg_req(1,"say",num)){
           str="";
           for (i=1;i<num;i++)
           {
           str+=string(val[i])+" ";
           }
           show_message_async(str);
           }
           break;
case "print":if (con_arg_req(1,"print",num)){
           var str="";
           for (var i=1;i<num;i++)
           {
           str+=string(val[i])+" ";
           }
           con_add(str,c_gray);
           }
           break;
           
case "chatadd":if (con_arg_req(1,"chatadd",num)){
           var str="";
           for (var i=1;i<num;i++)
           {
           str+=string(val[i])+" ";
           }

           if (room==global.rm)
           {
           script_addline(str);
           }
           else
           if (room!=rm_temp)
           {
           con_add("Cant add text to chat",c_yellow);
           }
           }
           break;

           
case "exec":if (con_arg_req(1,"exec",num))
           {
           if (file_exists(global.g_dir+val[1]))
              {
              con_parse_file(global.g_dir+val[1]);
              }
              else
              con_add("File not exists!",c_red);
           }
           break;

           
case "settings":room_goto(rm_settings);break;
case "blood_effects":if (con_arg_req(1,"blood_effects",num)){
                    if ( val[1]=="1" or val[1]=="true")
                    {
                    global.blood_effects=true;
                    }
                    else
                    if (val[1]=="0" or val[1]=="false")
                      {
                      global.blood_effects=false;
                      }
                    else
                    {
                    con_add("Unkown argument:"+string(val[1])+", use 1/true or 0/false",c_red);
                    }
                    }
                    break;

case "map_load":if (con_arg_req(1,"map_load",num))
                 {
                 if (file_exists(global.g_dir+"\maps\"+val[1]))
                    {
                    map_load(global.g_dir+"\maps\"+val[1])
                    }
                    else
                    con_add("File not exists "+global.g_dir+"\maps\"+val[1],c_red);
                 }

case "map_list": {
                 con_add_map_list();
                 }
                 break;
case "map_varify":if (con_arg_req(1,"map_varify",num))
                 {
                 switch (map_varify_map(global.g_dir+"\maps\"+string(val[1])))
                     {
                     case 1 : con_add("["+val[1]+"] Supported!",c_green);break;
                     case 0 : con_add("["+val[1]+"] Old Map!",c_yellow);break;
                     case -1: con_add("["+val[1]+"] Invalid Map!",c_red);break;
                     case -2: con_add("["+val[1]+"] Map not found!",c_red);break;
                     }
                 }break;
case "map_varify_all":con_map_varify_all();break;
case "exit":with (o_Console) active=false;break;
case "addbot":if (con_arg_req(3,"addbot",num))
               {
               if (room==rm_temp){
               val[1]=real(string_digits(val[1]));
               val[2]=real(string_digits(val[2]));
               val[3]=real(string_digits(val[2]));
               if (val[1]>0 and val[1]<room_width and val[2]>0 and val[2]<room_height)
               {
               if (val[3]==1)
               {var inst=instance_create(val[1],val[2],obj_ai_unit); inst.team=1; global.terr_no+=1;}
               else
               if (val[3]==0){
               var inst=instance_create(val[1],val[2],obj_ai_unit); inst.team=0; global.ct_no+=1;}
               }
               }
               }
               break;
case "help":for (var i=0;i<ds_list_size(global.con_com_list);i++)
            {
            con_add(">"+ds_list_find_value(global.con_com_list,i),c_gray);
            }
            break;
case "appsurface":if (con_arg_req(1,"appsurface",num))
                  {
                  if (val[1]=="1" or val[1]=="true")
                     {
                     application_surface_enable(true);
                     con_add("> App surface On",c_yellow);
                     }
                     else
                  if (val[1]=="0" or val[1]=="false")
                     {
                     application_surface_enable(false);
                     con_add(">App surface False",c_yellow)
                     }
                     else
                  if (val[1]=="get" or val[1]=="state")
                     {
                     con_add(">Appsurace status: "+string(application_surface_is_enabled()),c_yellow);
                     }
                     else
                     con_add("Unkown argument "+string(val[1])+" please use 1/true, 0/false, get/status.",c_red);
                  }
                  break;
case "shader":if (con_arg_req(1,"shader",num))
              {
              if (application_surface_is_enabled()){
              switch (val[1])
                   {
                   case "invert" : global.shader=shader_invert; con_add(">Shader : invert",c_red); break;
                   case "blackwhite":global.shader=shader_black_white; con_add(">Shader : blackwhite",c_red);break;
                   case "sapia" : global.shader=shader_sapia; con_add(">Shader : sapia",c_red) break;
                   case "greenish":global.shader=shader_greenish; con_add(">Shader : greenish",c_red) break
                   case "off" : global.shader=-1;  con_add(">Shader : off",c_red) break;
                   default : con_add(">Shader with name: "+string(val[1])+" not found!",c_red)
                   }
                }
                else
                con_add("Error On app surface first",c_red);
              }break;
              
case "radar" :
              if (con_arg_req(1,"radar",num)){
               switch (val[1])
               {
               case "playeranglesize" : ds_map_add(global.settings_map,"radar_angle_0_size",real(val[2]));break;
               }
               }
               break;
case "consolebt":
               if (con_arg_req(1,"consolebt",num))
               {
               switch (val[1])
               {
               case "1": global._CREATE_CON = true;break;
               case "0": global._CREATE_CON = false;break;
               }
               }
               break;
case "joinserverbt":
               if (con_arg_req(1,"joinserverbt",num))
               {
               switch (val[1])
               {
               case "1": global._CREATE_JSBT = true;break;
               case "0": global._CREATE_JSBT = false;break;
               }
               }
               break;
//----------
default:con_add("Unkown command :"+string(val[0]),c_red);break;

}

       