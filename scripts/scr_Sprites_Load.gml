
//dir="/sdcard/CS2D/gfx/";
dir=global.g_dir+"gfx/";
show_debug_message(dir);
globalvar spr_terr_0,spr_blood,spr_btbullet,spr_bullet,spr_Button_menu,spr_button,
spr_dirlight,spr_feet,spr_flash,spr_font_no,spr_joystick,spr_load,spr_mask,
spr_msgbox,spr_player_0,spr_player_1,spr_player_2,spr_pointer,spr_round_button,spr_simple_back,spr_Solid,spr_tickbox,
spr_weaponback,spr_roundlight,spr_button_0,spr_HudElements,spr_box_47,spr_flash_ico,spr_roundbt,
spr_hud_slot,spr_big_window,spr_hud_radar,spr_hud_outline,spr_realism_blood,spr_move_button,
spr_arrow;

spr_realism_blood = sprite_add(dir+"/realism_blood.png",1,0,0,0,0);
spr_arrow = sprite_add(dir+"/spr_arrow.png",1,0,0,0,0);
sprite_set_offset(spr_arrow,sprite_get_width(spr_arrow)/2,0);
spr_hud_radar = sprite_add(dir+"/hud_radar.png",1,0,0,0,0);
set_center_origin(spr_hud_radar);

spr_move_button = sprite_add(dir+"/move_button.png",1,0,0,0,0);
set_center_origin(spr_move_button);

spr_hud_outline = sprite_add(dir+"/hud_radar_outline.png",1,0,0,0,0);
set_center_origin(spr_hud_outline);

spr_big_window=sprite_add(dir+"/big_window.png",1,0,0,0,0);
spr_hud_slot= sprite_add(dir+"/hud_slot.png",1,0,0,0,0);

spr_roundbt= sprite_add(dir+"/roundbt.png",1,0,0,0,0);
set_center_origin(spr_roundbt);
spr_roundlight = sprite_add(dir+"/roundlight.png",1,0,0,0,0);
set_center_origin(spr_roundlight);

spr_flash_ico =  sprite_add(dir+"/flash_ico.png",1,0,0,0,0);
set_center_origin(spr_flash_ico);

spr_blood = sprite_add(dir+"/blood.png",1,0,0,0,0);
set_center_origin(spr_blood);


spr_btbullet = sprite_add(dir+"/btbullet.png",0,0,0,0,0);
set_center_origin(spr_btbullet);

spr_bullet = sprite_add(dir+"/bullet.png",0,0,0,0,0);
set_center_origin(spr_bullet);
spr_Button_menu = sprite_add(dir+"/Button_menu.png",0,0,0,0,0);
set_center_origin(spr_Button_menu);
spr_terr_0=sprite_add(dir+"/terr_0.png",0,0,0,14,16);


spr_button = sprite_add(dir+"/button.png",2,0,0,0,0);
set_center_origin(spr_button);

spr_button_0 = sprite_add(dir+"/button.png",2,0,0,0,0);

spr_dirlight = sprite_add(dir+"/directionallight.png",0,0,0,0,0);
sprite_set_offset(spr_dirlight,0,sprite_get_height(spr_dirlight)/2);

spr_feet = sprite_add(dir+"/feet.png",8,0,0,0,0);
set_center_origin(spr_feet);

spr_flash = sprite_add(dir+"/flash.png",0,0,0,0,0);
set_center_origin(spr_flash);


spr_box_47 = sprite_add(dir+"/box_47x47.png",2,0,0,0,0);
set_center_origin(spr_box_47);

spr_font_no = sprite_add(dir+"/font_no.png",12,0,0,0,0);

spr_joystick= sprite_add(dir+"/joystick.png",0,0,0,0,0);
set_center_origin(spr_joystick );

spr_load= sprite_add(dir+"/load.png",0,0,0,0,0);
set_center_origin(spr_load );

spr_mask= sprite_add(dir+"/mask.png",0,0,0,0,0);
set_center_origin(spr_mask );

spr_msgbox= sprite_add(dir+"/msgbox.png",0,0,0,0,0);

spr_player_0 = sprite_add(dir+"/player_0.png",3,0,0,14*2,16*2);

spr_player_1= sprite_add(dir+"/player_1.png",3,0,0,14,16);

spr_player_2= sprite_add(dir+"/player_2.png",3,0,0,14,16);

spr_pointer= sprite_add(dir+"/pointer.png",0,0,0,0,0);
set_center_origin(spr_pointer );

spr_round_button= sprite_add(dir+"/round_button.png",0,0,0,0,0);
set_center_origin(spr_round_button );

//spr_simple_back= sprite_add(dir+"/simple_back.png",0,0,0,0,0);

spr_Solid= sprite_add(dir+"/Solid.png",0,0,0,0,0);

spr_tickbox = sprite_add(dir+"/tickbox.png",2,0,0,0,0);
set_center_origin(spr_tickbox );

//spr_weaponback= sprite_add(dir+"/weapon_back.png",2,0,0,0,0);
//set_center_origin(spr_weaponback);

spr_HudElements = sprite_add(dir+"/HudElements.png",13,0,0,0,0);
set_center_origin(spr_HudElements);
//--------Weapons
globalvar spr_d_ak47,spr_ak47,spr_d_m4a1,spr_m4a1,spr_d_aug,spr_aug,spr_d_m3,spr_m3,spr_d_ump45,spr_ump45,
spr_d_mp5,spr_mp5,spr_d_deagle,spr_deagle,spr_d_glock,spr_glock,spr_usp,spr_d_usp,
spr_knife,spr_d_knife,spr_hud_ak47,spr_hud_m4a1,spr_hud_deagle,
spr_hud_mp5,
spr_hud_aug,
spr_hud_ump45,
spr_hud_glock,
spr_hud_usp,
spr_hud_m3;

spr_d_ak47= sprite_add(dir+"/weapons/d_ak47.png",1,0,0,0,0);
set_center_origin(spr_d_ak47);
spr_d_m4a1= sprite_add(dir+"/weapons/d_m4a1.png",1,0,0,0,0);
set_center_origin(spr_d_m4a1);
spr_d_aug= sprite_add(dir+"/weapons/d_aug.png",1,0,0,0,0);
set_center_origin(spr_d_aug);
spr_d_m3= sprite_add(dir+"/weapons/d_m3.png",1,0,0,0,0);
set_center_origin(spr_d_m3);
spr_d_ump45= sprite_add(dir+"/weapons/d_ump45.png",1,0,0,0,0);
set_center_origin(spr_d_ump45);
spr_d_mp5= sprite_add(dir+"/weapons/d_mp5.png",1,0,0,0,0);
set_center_origin(spr_d_mp5);
spr_d_deagle= sprite_add(dir+"/weapons/d_deagle.png",1,0,0,0,0);
set_center_origin(spr_d_deagle);
spr_d_glock= sprite_add(dir+"/weapons/d_glock.png",1,0,0,0,0);
set_center_origin(spr_d_glock);
spr_d_usp=sprite_add(dir+"/weapons/d_usp.png",1,0,0,0,0);
set_center_origin(spr_d_usp);
spr_d_knife= sprite_add(dir+"/weapons/knife.png",1,0,0,0,0);
set_center_origin(spr_d_knife);

spr_ak47= sprite_add(dir+"/weapons/ak47.png",1,0,0,0,30);
spr_m4a1= sprite_add(dir+"/weapons/m4a1.png",1,0,0,0,30);
spr_aug= sprite_add(dir+"/weapons/aug.png",1,0,0,0,30);
spr_m3= sprite_add(dir+"/weapons/m3.png",1,0,0,0,30);
spr_ump45= sprite_add(dir+"/weapons/ump45.png",1,0,0,0,30);
spr_mp5= sprite_add(dir+"/weapons/mp5.png",1,0,0,0,30);
///-pistols
spr_deagle= sprite_add(dir+"/weapons/deagle.png",1,0,0,-4,30);
spr_glock= sprite_add(dir+"/weapons/glock.png",1,0,0,-4,30);
spr_usp= sprite_add(dir+"/weapons/usp.png",1,0,0,-4,30);

spr_knife= sprite_add(dir+"/weapons/deagle.png",1,0,0,-10,30);

//Hud
spr_hud_ak47  =  sprite_add(dir+"/weapons/hud_ak47.png",1,0,0,0,0);
set_center_origin(spr_hud_ak47);
spr_hud_m4a1  =  sprite_add(dir+"/weapons/hud_m4a1.png",1,0,0,0,0);
set_center_origin(spr_hud_m4a1);

spr_hud_deagle  =  sprite_add(dir+"/weapons/hud_deagle.png",1,0,0,0,0);
set_center_origin(spr_hud_deagle);

spr_hud_mp5  =  sprite_add(dir+"/weapons/hud_mp5.png",1,0,0,0,0);
set_center_origin(spr_hud_mp5);

spr_hud_aug  =  sprite_add(dir+"/weapons/hud_aug.png",1,0,0,0,0);
set_center_origin(spr_hud_aug);

spr_hud_ump45  =  sprite_add(dir+"/weapons/hud_ump45.png",1,0,0,0,0);
set_center_origin(spr_hud_ump45);

spr_hud_glock =  sprite_add(dir+"/weapons/hud_glock.png",1,0,0,0,0);
set_center_origin(spr_hud_glock);

spr_hud_usp  =  sprite_add(dir+"/weapons/hud_usp.png",1,0,0,0,0);
set_center_origin(spr_hud_usp);
spr_hud_m3  =  sprite_add(dir+"/weapons/hud_m3.png",1,0,0,0,0);
set_center_origin(spr_hud_m3);
