#!/bin/bash


version=1.16.6
location=/usr/local
target=$HOME/.bashrc

wget -c https://golang.google.cn/dl/go$version.linux-amd64.tar.gz
sudo tar -zxvf go$version.linux-amd64.tar.gz -C $location

sudo echo "export GOROOT=$location/go" >> $target
sudo echo "export GOPATH=$location/go/code" >> $target
sudo echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> $target
source $HOME/.bashrc

go env -w GO111MODULE=auto
go env -w GOPROXY=https://goproxy.cn,direct

go version
