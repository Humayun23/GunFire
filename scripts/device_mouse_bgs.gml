globalvar DeviceNum,MouseX,MouseY,MouseTouch;
for( DeviceNum = 0; DeviceNum <=4; DeviceNum += 1; )
{
    MouseX[DeviceNum] = device_mouse_x(DeviceNum);
    MouseY[DeviceNum] = device_mouse_y(DeviceNum);
    MouseTouch[DeviceNum] = device_mouse_check_button( DeviceNum, mb_left);

};
