#!/bin/bash
docker build shop-db2/          -t fpiper/shop-db2-armhf
docker build shop-db2-admin/    -t fpiper/shop-db2-admin-armhf
docker build shop-db2-frontend/ -t fpiper/shop-db2-frontend-armhf
