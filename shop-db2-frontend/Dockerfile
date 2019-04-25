# -*- conf -*-
FROM balenalib/armv7hf-node

RUN [ "cross-build-start" ]

ENV HOST 172.0.0.1
ENV PORT 5000

# need build-essential and python to build node-sass
RUN apt update && apt install -y --no-install-recommends git nginx build-essential python 

RUN cd /srv && \
    git clone https://github.com/g3n35i5/shop-db2-frontend && \
    cd shop-db2-frontend && \
    npm install --prod

ADD shop-db-frontend /etc/nginx/sites-available/default
ADD environment.prod.ts /srv/shop-db2-frontend/src/environments/environment.prod.ts

RUN cd /srv/shop-db2-frontend && \
    sed -i 's/ng build/ng build --prod/g' package.json && \
    npm run build

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

RUN [ "cross-build-end" ]
