#!/bin/sh

default_version=5.7.32
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



sudo apt install libaio-dev libmecab2 -y

sudo wget -c \
http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-common_$version-1ubuntu18.04_amd64.deb \
http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-client_$version-1ubuntu18.04_amd64.deb \
http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-community-client_$version-1ubuntu18.04_amd64.deb \
http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-community-server_$version-1ubuntu18.04_amd64.deb
# http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-server_$version-1ubuntu18.04_amd64.deb

sudo dpkg -i \
mysql-common_$version-1ubuntu18.04_amd64.deb \
mysql-community-client_$version-1ubuntu18.04_amd64.deb \
mysql-client_$version-1ubuntu18.04_amd64.deb \
mysql-community-server_$version-1ubuntu18.04_amd64.deb

mysql --version


# http://mirrors.sohu.com/mysql/MySQL-5.7/
# http://mirrors.sohu.com/mysql/MySQL-8.0/
