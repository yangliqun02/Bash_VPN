sudo apt update
sudo apt install shadowsocks-libev
ss-server --version
sudo ss-local -c ./config_use.json &
export http_proxy="http://127.0.0.1:7680"
export https_proxy="http://127.0.0.1:7680"
curl --socks5 127.0.0.1:7680 socks5://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz
gzip -d gost-linux-amd64-2.11.1.gz
chmod +x gost-linux-amd64-2.11.1
sudo mv gost-linux-amd64-2.11.1 /usr/local/bin/gost
gost -L=:8080 -F=socks5://127.0.0.1:7680 &
export http_proxy="http://127.0.0.1:8080"
export https_proxy="http://127.0.0.1:8080"

