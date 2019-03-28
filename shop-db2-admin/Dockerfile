# -*- conf -*-
FROM node

ENV HOST 172.0.0.1
ENV PORT 5000

RUN cd /srv && \
    git clone https://github.com/g3n35i5/shop-db2-admin && \
    cd shop-db2-admin && \
    npm install && \
    npm run build && \
    sed -i 's/ng serve/ng serve --port 4200 --host 0.0.0.0/g' package.json

EXPOSE 4200

ADD run.sh /etc/init.d/run.sh
ENTRYPOINT /etc/init.d/run.sh