buffer=argument[0];

var socket = buffer_read(buffer,buffer_u8);
for (i=0;i<ds_list_size(DummiesList);i++)
        {
        inst=ds_list_find_value(DummiesList,i);
        if (instance_exists(inst))
          {
          if (inst.socket==socket)
          with inst instance_destroy();
          }
        }