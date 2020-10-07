#!/bin/bash

default_version=12.18.4
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

sudo wget -c https://npm.taobao.org/mirrors/node/v$version/node-v$version-linux-x64.tar.gz
sudo tar -zxvf node-v$version-linux-x64.tar.gz
sudo mv node-v$version-linux-x64 $location/node

sudo echo "export NODE_HOME=$location/node" >> $target
sudo echo "export NODE_PATH=$location/node/lib/node_modules" >> $target
sudo echo "export PATH=$PATH:$location/node/bin" >> $target

source $target

npm install -g cnpm --registry=https://registry.npm.taobao.org
