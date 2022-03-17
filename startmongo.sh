#!/bin/bash
mongod --dbpath . &
echo "mpngodb start requested"
sleep 2;
echo "post mpngodb wakeup"
cd /temp
node app.js