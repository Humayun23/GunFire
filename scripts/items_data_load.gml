globalvar ItemDat,ItemTotal,_itemLength;

ItemTotal=0;
n=1;
ItemDat[n,0]="M4A1"; //name
ItemDat[n,1]=spr_d_m4a1; //item hud spr;
ItemDat[n,2]=spr_m4a1; //item game spr;
ItemDat[n,3]=100; //price
ItemDat[n,4]=30;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=7;     //fire rate n per second
ItemDat[n,7]=15; //Damage
ItemDat[n,8]="rifle"//type
ItemDat[n,9]=snd_m4a1//sound
ItemDat[n,10]=1 //type 1 for primary 2 for seconday 3 for blade 4 bomb 5 for items like c4,key e.t.c
ItemDat[n,11]=150; //max round
ItemDat[n,12]=spr_hud_m4a1; //hud image

n=2;
ItemDat[n,0]="AK47"; //name
ItemDat[n,1]=spr_d_ak47; //item hud spr;
ItemDat[n,2]=spr_ak47; //item game spr;
ItemDat[n,3]=100; //price
ItemDat[n,4]=30;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=6;     //fire rate n per second
ItemDat[n,7]=14; //Damage
ItemDat[n,8]="rifle" //type
ItemDat[n,9]=snd_ak47//sound
ItemDat[n,10]=1;
ItemDat[n,11]=150; //max round
ItemDat[n,12]=spr_hud_ak47; //hud image


n=3;
ItemDat[n,0]="AUG"; //name
ItemDat[n,1]=spr_d_aug; //item hud spr;
ItemDat[n,2]=spr_aug; //item game spr;
ItemDat[n,3]=130; //price
ItemDat[n,4]=30;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=5;     //fire rate n per second
ItemDat[n,7]=12+5; //Damage
ItemDat[n,8]="rifle" //type
ItemDat[n,9]=snd_aug//sound
ItemDat[n,10]=1
ItemDat[n,11]=120; //max round
ItemDat[n,12]=spr_hud_aug //hud image

n=4;
ItemDat[n,0]="M3"; //name
ItemDat[n,1]=spr_d_m3; //item hud spr;
ItemDat[n,2]=spr_m3; //item game spr;
ItemDat[n,3]=90; //price
ItemDat[n,4]=7;   //bullets per round
ItemDat[n,5]=63;  //maximum bullets
ItemDat[n,6]=1;     //fire rate n per second
ItemDat[n,7]=1+5; //Damage
ItemDat[n,8]="shotgun" //type
ItemDat[n,9]=snd_m3//sound
ItemDat[n,10]=1;
ItemDat[n,11]=28; //max round
ItemDat[n,12]=spr_hud_m3 //hud image


n=5;
ItemDat[n,0]="UMP45"; //name
ItemDat[n,1]=spr_d_ump45; //item hud spr;
ItemDat[n,2]=spr_ump45; //item game spr;
ItemDat[n,3]=95; //price
ItemDat[n,4]=30;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=6;     //fire rate n per second
ItemDat[n,7]=8+5; //Damage
ItemDat[n,8]="submachine" //type
ItemDat[n,9]=snd_ump5//sound
ItemDat[n,10]=1;
ItemDat[n,11]=150; //max round
ItemDat[n,12]=spr_hud_ump45 //hud image


n=6;
ItemDat[n,0]="MP5"; //name
ItemDat[n,1]=spr_d_mp5; //item hud spr;
ItemDat[n,2]=spr_mp5; //item game spr;
ItemDat[n,3]=98; //price
ItemDat[n,4]=30;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=9;     //fire rate n per second
ItemDat[n,7]=6+5; //Damage
ItemDat[n,8]="submachine" //type
ItemDat[n,9]=snd_mp5//sound
ItemDat[n,10]=1;
ItemDat[n,11]=150; //max round
ItemDat[n,12]=spr_hud_mp5//hud image


n=7;

ItemDat[n,0]="Deagle"; //name
ItemDat[n,1]=spr_d_deagle; //item hud spr;
ItemDat[n,2]=spr_deagle; //item game spr;
ItemDat[n,3]=50; //price
ItemDat[n,4]=7;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=1.5;     //fire rate n bullets per second
ItemDat[n,7]=12+5; //Damage
ItemDat[n,8]="pistol" //type
ItemDat[n,9]=snd_deagle//sound
ItemDat[n,10]=2;
ItemDat[n,11]=56; //max round
ItemDat[n,12]=spr_hud_deagle //hud image


n=8;
ItemDat[n,0]="Glock"; //name
ItemDat[n,1]=spr_d_glock; //item hud spr;
ItemDat[n,2]=spr_glock; //item game spr;
ItemDat[n,3]=40; //price
ItemDat[n,4]=8;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=2.5;     //fire rate n bullets per second
ItemDat[n,7]=3.5+5; //Damage
ItemDat[n,8]="pistol" //type
ItemDat[n,9]=snd_glock//sound
ItemDat[n,10]=2;
ItemDat[n,11]=64; //max round
ItemDat[n,12]=spr_hud_glock; //hud image


n=9;

ItemDat[n,0]="USP"; //name
ItemDat[n,1]=spr_d_usp; //item hud spr;
ItemDat[n,2]=spr_usp; //item game spr;
ItemDat[n,3]=30; //price
ItemDat[n,4]=10;   //bullets per round
ItemDat[n,5]=150;  //maximum bullets
ItemDat[n,6]=2;     //fire rate n bullets per second
ItemDat[n,7]=5+5; //Damage
ItemDat[n,8]="pistol" //type
ItemDat[n,9]=snd_usp//sound
ItemDat[n,10]=2;
ItemDat[n,11]=150; //max round
ItemDat[n,12]=spr_hud_usp //hud image


n=10;
ItemDat[n,0]="Knife"; //name
ItemDat[n,1]=spr_d_knife; //item hud spr;
ItemDat[n,2]=spr_knife; //item game spr;
ItemDat[n,3]=50; //price
ItemDat[n,4]=1;   //bullets per round
ItemDat[n,5]=1;  //maximum bullets
ItemDat[n,6]=2;     //fire rate n bullets per second
ItemDat[n,7]=20; //Damage
ItemDat[n,8]="blade" //type
ItemDat[n,9]=snd_knife//sound
ItemDat[n,10]=3; //type
ItemDat[n,11]=1; //max round
ItemDat[n,12]=ItemDat[n,1]; //hud image


ItemTotal=10; //-1



/*for (i=0;i<9;i++)
{
_itemLength[i] =  //real(inf_read_string(working_directory+"CS2D\Sys\Weapons\weaponlength.dat",ItemDat[i,8]));
}*/
for (i=1;i<=ItemTotal;i++)
{
switch (ItemDat[i,8])
{
case "pistol" : _itemLength[i]= 22.0; break;
case "rifle" : _itemLength[i]= 31.0; break;
case "shotgun" : _itemLength[i]= 11.0; break;
case "submachine" : _itemLength[i]= 23.0; break;
case "blade" : _itemLength[i]= 20.0; break;
}
}
