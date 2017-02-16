#!/bin/bash
$DST_ROOT/steamcmd.sh +login anonymous +force_install_dir $DST_ROOT/server_dst +app_update 343050 validate +quit

cd $DST_ROOT/server_dst/bin
./dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard Master
