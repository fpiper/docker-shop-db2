#!/bin/bash
docker push fpiper/shop-db2:x86
docker push fpiper/shop-db2-admin:x86
docker push fpiper/shop-db2-frontend:x86

docker push fpiper/shop-db2:arm
docker push fpiper/shop-db2-admin:arm
docker push fpiper/shop-db2-frontend:arm
