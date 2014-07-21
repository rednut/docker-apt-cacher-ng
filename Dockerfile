#
# Apt-Cacher-NG: dockefile to contain the apt cacher ng which caches apt .deb downloads
#
# create data container: docker run -name apt-cache-data -v /var/cache busybox true
#
# run cacher: docker run -volumes-from apt-cache-data -P -p 3142:3142 -d   rednut/apt-cacher-ng
#

#### dockr run -name apt-cacher-data -v /var/cache  busybox true


FROM ubuntu:precise
MAINTAINER stuart nixon <dotcomstu@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-cacher-ng
RUN mkdir -p /data/cache /data/logs/

WORKDIR /data


CMD ["apt-cacher-ng", "ForeGround=1", "CacheDir=/data/cache/", "LogDir=/data/logs/", "NetworkTimeout=300", "VerboseLog=2", "Debug=5"]
#######CMD ["/usr/sbin/apt-cacher-ng", "ForeGround=1", "CacheDir=/cache/", "LogDir=/cache/logs/"]
VOLUME ["/data/"]
EXPOSE 3142
