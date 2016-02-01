//
//  Adds a line to the display
// argument0 = the test, argument1 = the color
//
{
  for (i=0; i<global.maxline-1; i+=1)
  {
    global.line[i] = global.line[i+1];
    global.alpha[i] = global.alpha[i+1];
  }
    global.line[global.maxline-1] = argument0;
    global.alpha[global.maxline-1] = 1.0;
}