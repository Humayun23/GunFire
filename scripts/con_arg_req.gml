////con_arg_req(req,comand,num)
if (argument0>(argument2-1))
{
con_add("Command require("+string(argument1)+") "+string(argument0)+" arguments "+string(argument2-1)+" provided",c_red);
return -1;
}
else
return 1;
