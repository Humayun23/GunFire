///script_addline_con(text,colour)
//  Adds a line to the display
// argument0 = the test, argument1 = the color
//
//{
//  for (i=0; i<global.con_maxline-1; i+=1)
///  {
//    global.con_line[i] = global.con_line[i+1];
//    global.con_colour[i] = global.con_colour[i+1];
//  }
//    global.con_line[global.con_maxline-1] = argument0;
//    global.con_colour[global.con_maxline-1] = argument1;
    ds_list_add(global.con_list,argument0);
    ds_list_add(global.con_list_colour,argument1);
    
    if (instance_exists(o_Console)) with (o_Console) 
    {
    itemCurrent = ds_list_size(global.con_list)-1;
    }
//}
