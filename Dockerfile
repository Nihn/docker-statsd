FROM node:6.9.1-slim
MAINTAINER mateuszmoneta@gmail.com

ENV STATSD_USER=statsd

RUN wget https://github.com/etsy/statsd/archive/master.tar.gz && \
    npm install --no-optional master.tar.gz && \
    npm cache clear && \
    useradd $STATSD_USER && \
    wget https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 -O /usr/local/bin/dumb-init && \
    chmod +x /usr/local/bin/dumb-init

COPY config.js /etc/statsd.js
ONBUILD COPY config.js /etc/statsd.js

EXPOSE 8125/udp
USER $STATSD_USER

ENTRYPOINT ["dumb-init"]
CMD ["/node_modules/statsd/bin/statsd", "/etc/statsd.js"]
