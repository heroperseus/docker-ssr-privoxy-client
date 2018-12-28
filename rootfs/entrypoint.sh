#!/bin/sh

#------------------------------------------------------------------------------
# Configure the service:
#------------------------------------------------------------------------------

sslocal -s ${SERVER_ADDR} -p ${SERVER_PORT} -k ${PASSWORD} -b 0.0.0.0 -l 7070 -m ${METHOD} -O ${PROTOCOL} -o ${OBFS} -d start
env /usr/sbin/privoxy --no-daemon /etc/privoxy/config
