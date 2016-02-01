var t_files=1,file;
file[t_files]=file_find_first(global.g_dir+"maps\*.gfmap",0);
show_debug_message(file[t_files]);
while (file[t_files]!="")
{

t_files++;
file[t_files]=file_find_next();
}
file_find_close();
con_add("Total Maps:"+string(t_files-1),c_white);
for (var i=1;i<t_files;i++)
{
                 {
                 switch ( map_varify_map(global.g_dir+"maps\"+string(file[i])))
                     {
                     case  1 : con_add(">["+file[i]+"] Supported!",c_green);break;
                     case  0 : con_add(">["+file[i]+"] Old Map!",c_yellow);break;
                     case -1 : con_add(">["+file[i]+"] Invalid Map!",c_red);break;
                     case -2 : con_add(">["+file[i]+"] Map not found!",c_red);break;
                     case -3 : con_add(">["+file[i]+"] Unknown Map!",c_blue);break;
                     }
}
}
