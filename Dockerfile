FROM node:6.11.2-alpine
MAINTAINER mateuszmoneta@gmail.com

ENV STATSD_USER=statsd

RUN npm install statsd@0.8.0 && \
    npm cache clear --force && \
    adduser -S $STATSD_USER && \
    echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    apk --update add dumb-init

COPY config.js /etc/statsd.js
ONBUILD COPY config.js /etc/statsd.js

EXPOSE 8125/udp
USER $STATSD_USER

ENTRYPOINT ["dumb-init"]
CMD ["/node_modules/statsd/bin/statsd", "/etc/statsd.js"]
