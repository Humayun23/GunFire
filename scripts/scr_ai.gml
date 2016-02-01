var var1, var2, var3
{
//Find a target

if instance_exists(target) == 0
    target = -1
if instance_number(obj_ai_par) == 0
    exit

if random(1) < 0.1
    {
    if target == -1
        {
        var1 = 0
        var2 = instance_number(obj_ai_par)
        while var1 < var2
            {
            var1 += 1
            var3 = instance_nth_nearest(x,y,obj_ai_par,var1)
            if var3.team != team
                {
                if point_distance(x,y,var3.x,var3.y) > 300
                    break
                else
                    target = var3
                break
                }
            }
        }
    else
        {
        if collision_line(x,y,target.x,target.y,oSolid,0,0) > 0
            {
            var1 = 0
            var2 = instance_number(obj_ai_par)
            while var1 < var2
                {
                var1 += 1
                var3 = instance_nth_nearest(x,y,obj_ai_par,var1)
                if var3.team != team && collision_line(x,y,var3.x,var3.y,oSolid,0,0) < 0
                    {
                    if point_distance(x,y,var3.x,var3.y) > 300
                        break
                    else
                        target = var3
                    break
                    }
                }
            }
        }
    }
if target != -1
    {
    path_end();
    speed=0;
    timeout=0;
    //Shoot; replace this code with whatever you need for to create bullets and mayhem and stuff
    //This code uses spd and dir variables within to target so as to lead the target when shooting
    image_angle = (point_direction(x,y,target.x,target.y));
 //   image_angle=point_direction(x,y,target.x,target);
    if collision_line(x,y,target.x,target.y,oSolid,0,0) < 0
        {
        scr_ai_shoot();
        }
    //Is target dead?
    if instance_exists(target) == 0
        {
        target = -1
        exit
        }
/*    //Dodge bullets
    var1 = 0
    var2 = instance_number(obj_Bullet)
    while var1 < var2
        {
        var1 += 1
        var3 = instance_nth_nearest(x,y,obj_Bullet,var1)
        if point_distance(x,y,var3.x,var3.y) > 48
            var1 = var2+1;
        else if var3.team != team
            {
            mp_potential_step_object(x+lengthdir_x(16*sign(angle_difference(point_direction(var3.x,var3.y,x,y),var3.direction)),point_direction(var3.x,var3.y,x,y)+90),y+lengthdir_y(16*sign(angle_difference(point_direction(var3.x,var3.y,x,y),var3.direction)),point_direction(var3.x,var3.y,x,y)+90),3,oSolid)
            exit;
            }
        }*/
    if hp >= target.hp/2 || hp > 50
        {
        //Move to the target, and stay within a certain distance whilst maintaining a buffer
        if point_distance(x,y,target.x,target.y) > 128*2 || collision_line(x,y,target.x,target.y,oSolid,0,0) > 0
            mp_potential_step_object(target.x,target.y,3,oSolid)
        if point_distance(x,y,target.x,target.y) < 128 && collision_line(x,y,target.x,target.y,oSolid,0,0) < 0
            mp_potential_step_object(target.x,target.y,-3,oSolid)
        }
    else
        {
        
        //Move away from the target, and try and get behind some cover
        var1 = instance_nearest(x,y,oSolid)
        var2 = point_direction(target.x,target.y,var1.x+16,var1.y+16)
        mp_potential_step_object(var1.x+lengthdir_x(32,var2),var1.y+lengthdir_y(32,var2),3,oSolid)
        }
    
    }
else
    {
    //Search around the world if bored and lonely to find a new target
    timeout-=1;
//    if (mp_grid_path(grid,path,x,y,searchx,searchy,true))
//    path_start(path,3,0,0);
//    else
//    timeout=0;
    
    mp_potential_step_object(searchx,searchy,3,oSolid);
    if (target<0)
    image_angle = (image_angle+(sin(degtorad(point_direction(xprevious,yprevious,x,y)-image_angle))))
    else
    image_angle = (point_direction(x,y,target.x,target.y));
    
    if point_distance(x,y,searchx,searchy) < 64 && random(120) < 1 or timeout<=0
        {
        if (irandom(5)<4){
        if (team==0) {//if ct
        searchx = o_TSpawn.x;
        searchy = o_TSpawn.y;
           }
           else
               {
               searchx=o_CTSpawn.x;
               searchy=o_CTSpawn.y;
               }
        }
        else
        {
        searchx = random(room_width);
        searchy = random(room_height);
        while (instance_place(searchx,searchy,oSolid)){
        searchx = random(room_width);
        searchy = random(room_height);
        }
        timeout=room_speed*20;
        }
        }
    }
}