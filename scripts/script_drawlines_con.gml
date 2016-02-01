var a=argument0;b=argument1;
//draw_set_font(fontMain);

var cl;
cl[0]=c_white;
cl[1]=c_white;

//draw list
draw_rectangle(listX,listY,listX+listW,listY+listH,true);

//draw list content
//if (ds_list_size(global.con_list)<itemsShow) itemsShow=ds_list_size(global.con_list); else itemsShow=50;
for(var A=0;A<itemsShow;A++){
 if (!is_undefined(global.con_list[| A+itemCurrent])){
     //this is going to show the inventory list
    var itemH=listH/itemsShow;
    
 var  mouseWithin=0//point_in_rectangle(mouse_x,mouse_y,listX,listY+A*itemH,buttonX[0]-1,listY+(A+1)*itemH-2);
    
    draw_set_valign(fa_center);
    //draw list item red if it's hovered
    draw_set_colour(ds_list_find_value(global.con_list_colour,A+itemCurrent));     
   
    draw_text(listX+itemsOffset,listY+A*(listH/itemsShow)+itemH/2,global.con_list[| A+itemCurrent]);
    
    
    //if clicked, show a message
    if mouse_check_button_pressed(mb_left) && mouseWithin{
      //  show_message("You clicked "+global.con_list[| A+itemCurrent]);
    }
    }
}
draw_set_colour(c_white);

//draw bar
draw_rectangle(listX+listW,listY,listX+listW+barW,listY+listH,true);

//draw top button

var mouseWithin=0//point_in_rectangle(mouse_x,mouse_y,buttonX[0],buttonY[0],buttonX[0]+buttonsW,buttonY[0]+buttonsH);

draw_set_colour(c_white);
draw_rectangle(buttonX[0],buttonY[0],buttonX[0]+buttonsW,buttonY[0]+buttonsH,true);

draw_text(buttonX[0]+buttonsW/2,buttonY[0]+buttonsH/2,"^");


if mouse_check_button_pressed(mb_left) && mouseWithin{

    itemCurrent=clamp(itemCurrent-1,0,ds_list_size(global.con_list)-itemsShow);
}

//draw bottom button

var mouseWithin=0 //point_in_rectangle(mouse_x,mouse_y,buttonX[1],buttonY[1],buttonX[1]+buttonsW,buttonY[1]+buttonsH);



draw_set_colour(c_white);
draw_rectangle(buttonX[1],buttonY[1],buttonX[1]+buttonsW,buttonY[1]+buttonsH,1);
draw_text(buttonX[1]+buttonsW/2,buttonY[1]+buttonsH/2,"v");



if mouse_check_button_pressed(mb_left) && mouseWithin{

    itemCurrent=clamp(itemCurrent+1,0,ds_list_size(global.con_list)-itemsShow);
}



//get some coords
var dragY,dragR,itemsMax,h,p,b;
 
itemsMax=max(itemsShow,ds_list_size(global.con_list));
h=barH/itemsMax;//Item's height
p=h*(itemsMax-itemsShow);//Scroll's
b=h*itemsShow;//Bar's size

if barSelected{
    dragY=clamp(mouse_y-barOffsetY,listY+buttonsH,buttonY[1]-b);
    
    itemCurrent=round((dragY-(listY+buttonsH))/h);
}
else{
    dragY=listY+buttonsH+(itemCurrent/max(1,itemsMax-itemsShow))*p;
}


//check if the bar was clicked
 mouseWithin=point_in_rectangle(mouse_x,mouse_y,buttonX[0],dragY,buttonX[0]+barW,dragY+b+1)
 mouseWithin2=point_in_rectangle(mouse_x,mouse_y,listX,listY,listX+listW,listY+listH)


if mouse_check_button_pressed(mb_left) && mouseWithin{
    barSelected=true;
    barOffsetY=mouse_y-dragY;
}
else if mouse_check_button_released(mb_left){
    barSelected=false;
}
else if mouseWithin2{
    //manipulate and clamp the current first item
    itemCurrent=clamp(itemCurrent+mouse_wheel_down()-mouse_wheel_up(),0,ds_list_size(global.con_list)-itemsShow);
}

//Draw scrollbar
var c;
if (barSelected) c=c_red else c=c_gray;
draw_set_colour(c);//set colour according to barSelected
draw_rectangle(buttonX[0],dragY,buttonX[0]+barW,dragY+b,0);
draw_set_colour(c_white);//set colour according to barSelected
draw_rectangle(buttonX[0],dragY,buttonX[0]+barW,dragY+b,1);
draw_set_colour(c_white);

//draw_sprite(imageScroll2,barSelected,buttonX[0]+barW/2,dragY+b/2);