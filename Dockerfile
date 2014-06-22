#
# Apt-Cacher-NG: dockefile to contain the apt cacher ng which caches apt .deb downloads
#
# create data container: docker run -name apt-cache-data -v /var/cache busybox true
#
# run cacher: docker run -volumes-from apt-cache-data -P -p 3142:3142 -d   rednut/apt-cacher-ng
#

#### dockr run -name apt-cacher-data -v /var/cache  busybox true


FROM ubuntu
MAINTAINER stuart nixon <dotcomstu@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-cacher-ng
RUN ln -s /var/cache/apt-cacher-ng /cache

ENTRYPOINT [ "/usr/sbin/apt-cacher-ng", "ForeGround=1", "CacheDir=/var/cache/apt-cacher-ng" ]
VOLUME [ "/cache/" ]
EXPOSE 3142
