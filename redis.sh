#!/bin/sh

default_version=6.0.8
default_location=/usr/local
target=/etc/profile


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

sudo apt install make cmake pkg-config -y

sudo wget -c https://mirrors.huaweicloud.com/redis/redis-$version.tar.gz
sudo tar -zxvf redis-$version.tar.gz

cd redis-$version/
sudo make -j4 && sudo make install

redis-server -v


# /etc/redis/redis.conf
# /usr/local/bin/redis-cli
# /usr/local/bin/redis-server