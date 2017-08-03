# Docker image for StatsD #
[![](https://images.microbadger.com/badges/version/mateuszm/statsd.svg)](http://microbadger.com/images/mateuszm/statsd) [![](https://images.microbadger.com/badges/image/mateuszm/statsd.svg)](http://microbadger.com/images/mateuszm/statsd)

This repository contains a minimal image with StatsD working. By default this image try to connect to Graphite on `localhost:2003` and expose `8125` port.

## Quick start ##
```
docker run -d -p 8125:8125/udp mateuszm/statsd
```

## Alternate config ##

To alternate config you just need Dockerfile with:
```dockerfile
FROM mateuszm/statsd
```
and file named `config.js` in same directory. `ONBUILD` directive will copy your file to `StatsD` config directory. Configuration options can be found [here](https://github.com/etsy/statsd/blob/v0.8.0/exampleConfig.js).
