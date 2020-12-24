#!/bin/bash


version=6.0.9

sudo apt install make cmake pkg-config -y

wget -c https://mirrors.huaweicloud.com/redis/redis-$version.tar.gz
tar -zxvf redis-$version.tar.gz

cd redis-$version/
make -j$(cat /proc/cpuinfo| grep "processor"| wc -l) && sudo make install

redis-server -v


# /etc/redis/redis.conf
# /usr/local/bin/redis-cli
# /usr/local/bin/redis-server
