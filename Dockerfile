FROM ubuntu:12.04
MAINTAINER Sergey Ershov "ershovu@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qqy && apt-get upgrade -qqy \
#  && apt-get update \
  && apt-get -y install wget \
#apt-utils psmisc \
  && cd /tmp/ \
  && wget http://packages.ivideon.com/public/keys/ivideon.list -O /etc/apt/sources.list.d/ivideon.list \
  && wget -O - http://packages.ivideon.com/public/keys/ivideon.key | apt-key add - \
  && wget http://downloads-cdn77.iv-cdn.com/bundles/server/install-ivideon-server.sh \
  && apt-get update \
#RUN cd /tmp/ \
  && chmod +x ./install-ivideon-server.sh \
  && ./install-ivideon-server.sh \
  && rm -rf /tmp/* \
  && apt-get remove -qqy wget \
  && apt-get autoremove -y \
  && apt-get clean

# add
#RUN cd /tmp/ \
#  && mkdir -p /etc/ivideon \
#  && echo "IVIDEON_SERVER_CONFIG=\"/opt/ivideon/ivideon-server/videoserverd.config\"" > "/etc/ivideon/server.conf" \
#  && echo "#!/bin/sh"                                                              > "/etc/ivideon/run_server" \
#  && echo "echo -n ' Start ivideon' && bash -c \"/etc/init.d/videoserver start\"" >> "/etc/ivideon/run_server" \
#  && echo ' sleep 3 && echo "  pid:`cat /tmp/videoserver.pid`"'                   >> "/etc/ivideon/run_server" \
#  && echo '#tail -f /opt/ivideon/ivideon-server/service.log'                      >> "/etc/ivideon/run_server" \
#  && echo '#/bin/sh'                                                              >> "/etc/ivideon/run_server" \
#  && chmod 755 /etc/ivideon/run_server

#EXPOSE 8080/tcp

#WORKDIR /etc/ivideon
#CMD ["/bin/bash", "-c", "set -e && /etc/ivideon/run_server && /bin/sh"]()

ENTRYPOINT ["/entrypoint.sh"]

COPY [ "add/", "/" ]

