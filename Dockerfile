#
# Apt-Cacher-NG: dockefile to contain the apt cacher ng which caches apt .deb downloads
#
# create data container: docker run -name apt-cache-data -v /var/cache busybox true
#
# run cacher: docker run -volumes-from apt-cache-data -P -p 3142:3142 -d   rednut/apt-cacher-ng
#


FROM rednut/base
MAINTAINER stuart nixon <dotcomstu@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-cacher-ng


ENTRYPOINT [ "/usr/sbin/apt-cacher-ng", "ForeGround=1", "CacheDir=/var/cache/apt-cacher-ng" ]
VOLUME [ "/var/cache/" ]
EXPOSE 3142
