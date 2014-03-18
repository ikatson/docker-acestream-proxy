# Set the base image to use to Ubuntu
FROM ubuntu:12.04

MAINTAINER Igor

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget openssh-server supervisor unzip

RUN echo 'deb http://repo.acestream.org/ubuntu/ precise main' > /etc/apt/sources.list.d/acestream.list
RUN wget -q -O - http://repo.acestream.org/keys/acestream.public.key | apt-key add -
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y acestream-engine vlc-nox python-gevent

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

RUN adduser --disabled-password --gecos "" tv

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD start.sh /start.sh

RUN chmod +x /start.sh

RUN cd /tmp/ && wget -q https://github.com/ikatson/aceproxy/archive/master.zip?v=2 -O master.zip
RUN cd /tmp/ && unzip master.zip -d /home/tv/

RUN echo 'root:password' |chpasswd

EXPOSE 22 8000 62062

ENTRYPOINT ["/start.sh"]
