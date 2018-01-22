FROM nimmis/golang

MAINTAINER OwnageTechGeek <ownagetechgeek@talentcraft.net>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget git && apt-get clean all
RUN useradd -s /bin/bash -d /typhoonlimbo -m typhoonlimbo
RUN cd /tmp
RUN go get github.com/satori/go.uuid
RUN go build
RUN mv ./TyphoonLimbo /typhoonlimbo/TyphoonLimbo
CMD /typhoonlimbo_init.sh
