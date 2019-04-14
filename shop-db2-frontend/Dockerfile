# -*- conf -*-
FROM balenalib/armv7hf-node

RUN [ "cross-build-start" ]

ENV HOST 172.0.0.1
ENV PORT 5000

# need build-essential and python to build node-sass
RUN apt update && apt install -y --no-install-recommends git build-essential python

RUN cd /srv && \
    git clone https://github.com/g3n35i5/shop-db2-frontend && \
    cd shop-db2-frontend && \
    npm install && \
    npm run build && \
    sed -i 's/ng serve/ng serve --port 4200 --host 0.0.0.0/g' package.json

EXPOSE 4200

ADD run.sh /etc/init.d/run.sh
ENTRYPOINT /etc/init.d/run.sh

RUN [ "cross-build-end" ]
