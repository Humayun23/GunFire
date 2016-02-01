//
//  Draws the collection of lines at the indicated place
//
{
  var xxx,yyy;
  xxx = argument0;
  yyy = argument1;
  draw_set_font(fnt_console);
  draw_set_alpha(1);
  for (i=0; i<global.con_maxline; i+=1)
  {
    draw_set_colour(global.con_colour[i]); 
    if (string_length(global.con_line[i])>50)
    draw_text(xxx,yyy,string_copy(global.con_line[i],1,50)+"...");
    else
    draw_text(xxx,yyy,global.con_line[i]);
    
    yyy += 20;
  }
}
