if (online())
{
if (file_exists("tmp"))
{
f=file_text_open_read("tmp");
_p=file_text_read_string(f);
file_text_close(f);
ff=file_text_open_write("tmp");
file_text_write_string(ff,_p);
file_text_writeln(ff);
file_text_write_string(ff,ds_map_write(ach_data));
file_text_writeln(ff);
file_text_write_string(ff,ds_map_write(ach_data2));
file_text_close(ff);
return 1;
}
else
return -2;
}
else
return -1;