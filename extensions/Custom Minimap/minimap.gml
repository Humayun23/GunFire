#define minimap_init
globalvar _minimap_surface, _minimap_image, _minimap_objects, _minimap_sprites, _minimap_xoffset, _minimap_yoffset;
globalvar _minimap_x, _minimap_y, _minimap_radius, _minimap_image_xoffset, _minimap_image_yoffset, _minimap_image_radius;
globalvar _minimap_image_mask, _minimap_output;

_minimap_surface       = surface_create(1, 1);               // The surface
_minimap_image         = -1;               // The image of the minimap
_minimap_objects       = ds_list_create(); // The objects to find
_minimap_sprites       = ds_list_create(); // The sprites representing the objects
_minimap_xoffset       = 0;                // The x center position on the minimap
_minimap_yoffset       = 0;                // The y center position on the minimap
_minimap_x             = 0;                // The x position in the room to calculate from
_minimap_y             = 0;                // The y position in the room to calculate from
_minimap_radius        = 32;               // The radius to search for objects
_minimap_image_xoffset = 0;                // The xoffset of the minimap image
_minimap_image_yoffset = 0;                // The yoffset of the minimap image
_minimap_image_radius  = 0;                // The radius of the image
_minimap_image_mask    = -1;

#define minimap_update_old
var obj, spr, dist, dir, i, xx, yy;
xx = _minimap_xoffset;
yy = _minimap_yoffset;
i  = -1;
surface_set_target(_minimap_surface);
draw_clear_alpha(0, 0);
repeat (ds_list_size(_minimap_objects)) {
    i += 1;
    obj = ds_list_find_value(_minimap_objects, i);
    spr = ds_list_find_value(_minimap_sprites, i);
    with (obj) {
        if (point_distance(x, y, _minimap_x, _minimap_y) < _minimap_radius * 2) {
            dist = _minimap_image_radius * (point_distance(x, y, _minimap_x, _minimap_y) / _minimap_radius)
            dir  = point_direction(_minimap_x, _minimap_y, x, y);
            draw_sprite(spr, 0, xx + lengthdir_x(dist, dir), yy + lengthdir_y(dist, dir));
        }
    }
}
draw_set_blend_mode_ext(0, 6);
draw_sprite(_minimap_image_mask, 0, _minimap_image_xoffset, _minimap_image_yoffset);
draw_set_blend_mode(bm_normal);
surface_reset_target();

#define minimap_update
var obj, spr, dist, dir, i, xx, yy, x1, y1;
xx = _minimap_xoffset;
yy = _minimap_yoffset;
x1 = argument0;
y1 = argument1;
i  = -1;
surface_set_target(_minimap_surface);
draw_clear_alpha(0, 0);
repeat (ds_list_size(_minimap_objects)) {
    i += 1;
    obj = ds_list_find_value(_minimap_objects, i);
    spr = ds_list_find_value(_minimap_sprites, i);
    with (obj) { 
        if (point_distance(x, y, x1, y1) < _minimap_radius ) {
            dist = _minimap_image_radius * (point_distance(x, y, x1, y1) / _minimap_radius)
            dir  = point_direction(x1, y1, x, y);
            draw_sprite(spr, 0, xx + lengthdir_x(dist, dir), yy + lengthdir_y(dist, dir));
        }else{
        if (spr!=spr_b){
             dir  = point_direction(x1, y1, x, y);
            draw_sprite(spr, 0, xx + lengthdir_x(_minimap_image_radius, dir), yy + lengthdir_y(_minimap_image_radius, dir));
            }
        }
            
    }
 //   draw_set_blend_mode(bm_add);
   // draw_sprite_ext(spr_flash,-1,xx+lengthdir_x(7, obj_Player.image_angle),yy+lengthdir_y(7, obj_Player.image_angle),1,1,obj_Player.image_angle,c_white,1);
 
}
draw_set_blend_mode_ext(0, 6);
draw_sprite(_minimap_image_mask, 0, _minimap_image_xoffset, _minimap_image_yoffset);
draw_set_blend_mode(bm_normal);
surface_reset_target();

#define minimap_set_sprite
if (surface_exists(_minimap_surface)) surface_free(_minimap_surface);
_minimap_surface = surface_create(sprite_get_width(argument0), sprite_get_height(argument0));
_minimap_image = argument0;
_minimap_image_mask = argument1;
_minimap_image_radius = argument2;
_minimap_image_xoffset = sprite_get_xoffset(_minimap_image);
_minimap_image_yoffset = sprite_get_yoffset(_minimap_image);

#define minimap_add_object
ds_list_add(_minimap_objects, argument0);
ds_list_add(_minimap_sprites, argument1);

#define minimap_remove_object
i = ds_list_find_index(_minimap_objects, argument0);
if (i != -1) {
    ds_list_delete(_minimap_objects, i);
    ds_list_delete(_minimap_sprites, i);
    return 1;
}
return 0;

#define minimap_draw

draw_sprite_ext(_minimap_image, 0, argument0 + _minimap_image_xoffset, argument1 + _minimap_image_yoffset,1,1,0,argument2,argument3);
if (surface_exists(_minimap_surface))
draw_surface(_minimap_surface, argument0, argument1);
else
_minimap_surface = surface_create(sprite_get_width(_minimap_image ), sprite_get_height(_minimap_image));


#define minimap_free
ds_list_destroy(_minimap_objects);
ds_list_destroy(_minimap_sprites);
if (surface_exists(_minimap_surface)) surface_free(_minimap_surface);

#define minimap_set_radius
_minimap_radius = argument0;

#define minimap_set_center
_minimap_xoffset = argument0;
_minimap_yoffset = argument1;