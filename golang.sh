#!/bin/sh

default_version=1.15.2
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

sudo wget -c https://golang.google.cn/dl/go$version.linux-amd64.tar.gz
sudo tar -zxvf go$version.linux-amd64.tar.gz -C $location

sudo echo "export GOROOT=$location/go" >> $target
sudo echo "export GOPATH=$location/go/code" >> $target
sudo echo "export PATH=$PATH:$location/go/bin:$location/go/code/bin" >> $target

go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn