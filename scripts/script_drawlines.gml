//
//  Draws the collection of lines at the indicated place
//
{
  var xxx,yyy;
  xxx = argument0;
  yyy = argument1;
  draw_set_font(fnt_14);
  draw_set_colour(c_yellow);
  
  for (i=0; i<global.maxline; i+=1)
  {
    draw_set_alpha(global.alpha[i]*1.5); 
    draw_text(xxx,yyy,global.line[i]);
    
    draw_set_alpha(1);
    global.alpha[i]-=0.003;
    yyy += 20;
  }
}
