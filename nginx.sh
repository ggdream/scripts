#!/bin/sh

default_version=1.18.0
default_location=/usr/local


if [ -n "$2" ] ;then
    version=$1
    location=$2
elif [ -n "$1" ] ;then
    version=$1
    location=$default_location
else
    echo "\e[31;40;1mYou have not entered any parameters, v$default_version will be selected by default.\e[0m"
    version=$default_version
    location=$default_location
fi


sudo apt install build-essential libtool libpcre3 libpcre3-dev zlib1g-dev openssl -y

# sudo wget -c http://nginx.org/download/nginx-$version.tar.gz
sudo wget -c https://repo.huaweicloud.com/nginx/nginx-$version.tar.gz
sudo tar -zxvf nginx-$version.tar.gz
cd nginx-$version/

./configure \
--prefix=/usr \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx/nginx.pid 
--lock-path=/var/lock/nginx.lock
sudo make -j4 && sudo make install

nginx -v