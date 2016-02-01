var t_files=1,file;
file[t_files]=file_find_first(global.g_dir+"maps\*.gfmap",0);
show_debug_message(file[t_files]);
while (file[t_files]!="")
{
t_files++;
file[t_files]=file_find_next();
}
file_find_close();
con_add("Total Maps:"+string(t_files-1),c_yellow);
for (var i=1;i<t_files;i++)
{
con_add(">"+string(filename_name(file[i])),c_gray);
}
