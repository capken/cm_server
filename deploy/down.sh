#!/bin/bash

cd $HOME/codes/cm_server/
cat ./tmp/pids/unicorn.pid | xargs kill -QUIT
sudo /etc/init.d/nginx stop
