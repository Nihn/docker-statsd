FROM node:6.9.1-slim
MAINTAINER mateuszmoneta@gmail.com

RUN wget https://github.com/mlowicki/statsd/archive/handle_stream_errors.tar.gz && \
    npm install --no-optional handle_stream_errors.tar.gz && \
    npm cache clear && \
    rm handle_stream_errors.tar.gz

COPY config.js /etc/statsd.js
ONBUILD COPY config.js /etc/statsd.js

EXPOSE 8125/udp

CMD ["/node_modules/statsd/bin/statsd", "/etc/statsd.js"]
