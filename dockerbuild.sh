#!/bin/bash
git checkout x86
docker build shop-db2/          -t fpiper/shop-db2:x86
docker build shop-db2-admin/    -t fpiper/shop-db2-admin:x86
docker build shop-db2-frontend/ -t fpiper/shop-db2-frontend:x86

git checkout arm
docker build shop-db2/          -t fpiper/shop-db2:arm
docker build shop-db2-admin/    -t fpiper/shop-db2-admin:arm
docker build shop-db2-frontend/ -t fpiper/shop-db2-frontend:arm
