#!/bin/bash


version=1.19.6
location=/usr/local

sudo apt install build-essential libtool libpcre3 libpcre3-dev zlib1g-dev openssl -y

# sudo wget -c http://nginx.org/download/nginx-$version.tar.gz
wget -c https://repo.huaweicloud.com/nginx/nginx-$version.tar.gz
tar -zxvf nginx-$version.tar.gz
cd nginx-$version/

./configure \
--prefix=$location \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx/nginx.pid  \
--lock-path=/var/lock/nginx.lock

make -j$(cat /proc/cpuinfo| grep "processor"| wc -l) && sudo make install


nginx -v
