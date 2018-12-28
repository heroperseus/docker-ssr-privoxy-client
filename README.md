# docker-ssr-privoxy-client
A SSR client on docker, inspired by GOOD21/shadowsocks-privoxy, bluebu/shadowsocks-privoxy and ssr related contributors. Feel free to use and modify.
Pre-configured with dropbox, google, facebook, twitter accessibility and TVDB for Video Staion on Synology NAS models which support Docker, modification can be made on `/etc/privoxy/config` to customize the proxy rules.
Only truffic matching the proxy rules will be redirect to ssr relay.

## Test run
```
sudo docker run -it -e SERVER_ADDR=server.address -e SERVER_PORT=port -e PASSWORD=password -e METHOD=method -e PROTOCOL=protocol -e OBFS=obfs imageid
```
