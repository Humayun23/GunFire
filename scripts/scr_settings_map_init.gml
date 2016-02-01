global.settings_map = ds_map_create();
//load settings from game.txt
var f =  global.g_dir+"/sys/settings.txt";
var appsurface = (inf_read_string(f,"appsurface","0"))
var light = (inf_read_string(f,"light","1"))
var draw_dat_win = (inf_read_string(f,"datwin","1"))
var light_intensity_multiply = (inf_read_string(f,"light_int_mult","1"))
var tbots = (inf_read_string(f,"tbots","6"))
var ctbots =(inf_read_string(f,"ctbots","5"))

var blood = (inf_read_string(f,"blood","1"))
var logo  = (inf_read_string(f,"logo","1"));

show_debug_message(tbots);
show_debug_message(ctbots);
///----------------
ds_map_add(global.settings_map,"appsurf",real(string_digits(appsurface)));
ds_map_add(global.settings_map,"light",real(string_digits(light)));
ds_map_add(global.settings_map,"dat_win",real(string_digits(draw_dat_win)));
ds_map_add(global.settings_map,"light_int_mult",real(light_intensity_multiply));
ds_map_add(global.settings_map,"tbots",real(tbots));
ds_map_add(global.settings_map,"ctbots",real(ctbots));
ds_map_add(global.settings_map,"blood",real(string_digits(blood)));
ds_map_add(global.settings_map,"logo",real(string_digits(logo)));
