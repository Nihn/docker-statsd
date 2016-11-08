FROM node:6.9.1-slim
MAINTAINER mateuszmoneta@gmail.com

ENV STATSD_USER=statsd

RUN npm install --no-optional statsd@0.7.2 && \
    npm cache clear && \
    useradd $STATSD_USER

COPY config.js /etc/statsd.js
ONBUILD COPY config.js /etc/statsd.js

EXPOSE 8125/udp
USER $STATSD_USER

CMD ["/node_modules/statsd/bin/statsd", "/etc/statsd.js"]
