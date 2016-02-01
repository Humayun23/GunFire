///data_upload(file)
if (online()){
if (file_exists(argument0)){
return http_post_string(website+"/file_upload.php","fname=members/"+(global.online_data[? "Name"])+"&fcont="+file_to_str(argument0));
}
else
return -1;
}
else
return -2;