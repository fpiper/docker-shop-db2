#!/bin/bash
docker build shop-db2/          -t fpiper/shop-db2
docker build shop-db2-admin/    -t fpiper/shop-db2-admin
docker build shop-db2-frontend/ -t fpiper/shop-db2-frontend
