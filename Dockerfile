FROM node:5.10-slim
MAINTAINER mateuszmoneta@gmail.com

RUN npm install --no-optional statsd@0.7.2 && \
    npm cache clear

COPY config.js /etc/statsd.js
ONBUILD COPY config.js /etc/statsd.js

EXPOSE 8125/udp

CMD ["/node_modules/statsd/bin/statsd", "/etc/statsd.js"]
