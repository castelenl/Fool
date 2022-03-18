#!/bin/sh
## 用于https://github.com/mixool/dockershc项目安装运行shadowsocks的脚本

if [[ "$(command -v workerone)" == "" ]]; then
    # install and rename
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
    apk add --no-cache shadowsocks-libev >/dev/null 2>&1
    mv /usr/bin/ss-server /usr/bin/workerone
    v2rayplugin_URL="$(wget -qO- https://api.github.com/repos/teddysun/xray-plugin/releases/latest | grep -E "browser_download_url.*linux-amd64" | cut -f4 -d\")"
    wget -O - $xray-plugin_URL | tar -xz -C /usr/bin/ && mv /usr/bin/xray-plugin_linux_amd64 /usr/bin/workertwo && chmod +x /usr/bin/workertwo
else
    # start 
    workerone -s 0.0.0.0 -p 8080 -k k333qjv7P2vSdZnEd7dH -m aes-128-gcm --plugin /usr/bin/workertwo --plugin-opts "server;path=/W2x0a5k9t3Fk/" >/dev/null 2>&1
fi
