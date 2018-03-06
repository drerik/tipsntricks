# Docker containers


## Simple container to strip ssl
This Container strips the ssl from a ssl connection encryptet with a client certificate
```
FROM alpine:3.6

MAINTAINER Erik Kaareng-Sunde <esu@enonic.com>

RUN apk update && apk add socat openssl

ADD client_certificate.crt
EXPOSE 80

CMD socat TCP-LISTEN:80,fork OPENSSL:your.remote.server.com:443,cert=/client_certificate.crt,verify=0


```
