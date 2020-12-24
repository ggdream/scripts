#!/bin/bash


version=1.15.6
location=/usr/local
target=$HOME/.bashrc

wget -c https://golang.google.cn/dl/go$version.linux-amd64.tar.gz
sudo tar -zxvf go$version.linux-amd64.tar.gz -C $location

echo "export GOROOT=$location/go" >> $target
echo "export GOPATH=$location/go/code" >> $target
echo "export PATH=$PATH:$location/go/bin:$location/go/code/bin" >> $target
source $target

go env -w GO111MODULE=auto
go env -w GOPROXY=https://goproxy.cn,direct

go version
