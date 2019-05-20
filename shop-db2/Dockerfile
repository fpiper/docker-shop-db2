# -*- conf -*-
FROM balenalib/armv7hf-python:3.7.2-stretch-build-20190127

RUN [ "cross-build-start" ]

ENV DB_FIRSTNAME John
ENV DB_LASTNAME Doe
ENV DB_PASSWORD admin123
ENV SECRET_KEY YOURBETTERSUPERSECRETKEY

# install dependencies
RUN apt update && \
    apt install -y --no-install-recommends \
	git \
	nginx \
	wkhtmltopdf
    	# python3 \
	# python3-venv \
	# python3-pip \

# get shop-db
RUN useradd -r shopdb_user && \
    cd /srv && \
    git clone https://github.com/g3n35i5/shop-db2.git && \
    chown -R shopdb_user:shopdb_user shop-db2

# nginx
RUN rm /etc/nginx/sites-enabled/default
ADD image/shop-db /etc/nginx/sites-enabled/shop-db 

# python virtualenv
RUN su shopdb_user -c "/bin/bash -c \"cd /srv/shop-db2 && python3 -m venv . && source bin/activate && \
    pip3 install -r requirements.txt && \
    cp configuration.example.py configuration.py && \
    sed -i 's/127.0.0.1/0.0.0.0/g' configuration.py\""
# python wsgi.py

# run as systemd service
# ADD image/shop-db@shopdb_user.service /etc/systemd/system/shop-db@shopdb_user.service	
# RUN systemctl --system daemon-reload && \
#     systemctl enable shop-db@shopdb_user && \
#     systemctl start shop-db@shopdb_user

VOLUME /srv/shop-db2/shopdb

EXPOSE 5000

ADD image/run.sh /etc/init.d/run.sh
ENTRYPOINT /etc/init.d/run.sh

RUN [ "cross-build-end" ]
