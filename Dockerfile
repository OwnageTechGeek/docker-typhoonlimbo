FROM nimmis/golang

MAINTAINER OwnageTechGeek <ownagetechgeek@talentcraft.net>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget git unzip && apt-get clean all
RUN useradd -s /bin/bash -d /typhoonlimbo -m typhoonlimbo
RUN cd /tmp
RUN wget https://github.com/TyphoonMC/TyphoonLimbo/archive/1.0.1.zip
RUN unzip "1.0.1.zip"
RUN mv TyphoonLimbo-1.0.1/* /root
RUN cd /root
RUN go get github.com/satori/go.uuid
RUN rm config.go
RUN wget https://raw.githubusercontent.com/OwnageTechGeek/TyphoonLimbo/master/config.go
RUN go build
RUN mv ./TyphoonLimbo /typhoonlimbo/TyphoonLimbo
CMD /typhoonlimbo_init.sh
