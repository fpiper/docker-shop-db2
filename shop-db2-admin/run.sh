#!/bin/bash

cd /srv/shop-db2-admin
sed -i "s/127.0.0.1:5000/$HOST:$PORT/g" src/proxy.conf.json

exec npm run start
