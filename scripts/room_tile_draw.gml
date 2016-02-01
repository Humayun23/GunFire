///room_tile_draw(tile_number_start_from_1 ,x,y,background,depth,room)
//var a=argument5;
var gridsize=32;
tilew=background_get_width(argument3);
tileh=background_get_height(argument3);
tilex=tilew/gridsize;
tiley=tileh/gridsize;
total_tiles=tilex*tiley
if argument0<=total_tiles
{
top=0;
left=0;
for (ii=1;ii < argument0;ii+=1)
{
if (left*gridsize) = (background_get_width(argument3)-gridsize)
{
top+=1;
left=0;
}
else
left+=1;
}


return room_tile_add(argument5,argument3,(left*gridsize),(top*gridsize),gridsize,gridsize,argument1,argument2,argument4);
}
else
return -1;