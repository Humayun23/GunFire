var DeviceNum;
for( DeviceNum = 0; DeviceNum <=4; DeviceNum += 1; )
{
    if( MouseTouch[DeviceNum] == 1 )
    {
        if( position_meeting( MouseX[DeviceNum], MouseY[DeviceNum], self) )
        {
          return 1;
        }
    }
}
return false;
