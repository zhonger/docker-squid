#Choose Debian
FROM debian:latest

LABEL maintainer="zhonger - zhonger@live.cn"

#Don't ask questions during install
ENV DEBIAN_FRONTEND noninteractive

#By default, Squid is on open proxy
ENV LDAP_ENABLE=false

#Install Squid3
RUN apt-get update && \
    apt-get -y install ca-certificates squid

#Ports
EXPOSE 3128

VOLUME ["/etc/squid"]

#Copy and run install script
#COPY ldap.config /opt/
COPY squid-start.sh /opt/
RUN chmod +x /opt/squid-start.sh
ENTRYPOINT ["/opt/squid-start.sh"]
