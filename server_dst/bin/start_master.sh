#!/bin/bash
/home/dst/steamcmd.sh +login anonymous +force_install_dir /home/dst/server_dst +app_update 343050 validate +quit

cd $HOME/server_dst/bin
./dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard Master
