#!/bin/bash
/home/dst/steamcmd.sh +login anonymous +force_install_dir /home/dst/server_dst +app_update 343050 validate +quit

# Go for mods (here?)

master_ip=`getent hosts master | awk '{ print $1 }'`

crudini --set --verbose /home/steam/.klei/DoNotStarveTogether/cluster.ini shard master_ip $master_ip

cd $HOME/server_dst/bin
./dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard Caves
