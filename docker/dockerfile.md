# Dockerfile snipplets

## noninteractive apt installs
```
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install [packagename] && apt-get clean
```
