FROM alpine:latest
MAINTAINER heroperseus <heroperseus@163.com>

RUN \
  apk --update --upgrade add \
      privoxy \
  && rm /var/cache/apk/*


RUN apk upgrade --no-cache \
    && apk add --no-cache bash tzdata python py-setuptools git libsodium \
    && git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git /shadowsocksr \ 
	&& cd /shadowsocksr && python setup.py install \
    && apk del git\
	&& rm -rf /shadowsocksr \
    rm -rf /var/cache/apk/*

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------
ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8899
ENV METHOD=aes-256-cfb
ENV TIMEOUT=300
ENV PASSWORD=
ENV PROTOCOL=auth_sha1_v4
ENV PROTOCOL_PARAM=
ENV OBFS=tls1.2_ticket_auth
ENV OBFS_PARAM= 


#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------
EXPOSE 8118 7070

ENTRYPOINT ["/entrypoint.sh"]
