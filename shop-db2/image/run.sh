#!/bin/bash

su -s /bin/bash  - shopdb_user <<EOF
cd /srv/shop-db2
python3 -m venv .
source bin/activate
sed -i 's/YouWillNeverGuess/$SECRET_KEY/g' configuration.py

python3 ./setupdb.py -f $DB_FIRSTNAME -l $DB_LASTNAME -p $DB_PASSWORD

python3 /srv/shop-db2/wsgi.py
EOF
