#!/bin/bash


version=14.15.4
location=/usr/local
target=$HOME/.bashrc

wget -c https://npm.taobao.org/mirrors/node/v$version/node-v$version-linux-x64.tar.gz
tar -zxvf node-v$version-linux-x64.tar.gz
sudo mv node-v$version-linux-x64 $location/node

echo "export NODE_HOME=$location/node" >> $target
echo "export NODE_PATH=$location/node/lib/node_modules" >> $target
echo "export PATH=\$PATH:\${NODE_HOME}/bin" >> $target
source $HOME/.bashrc


npm install -g cnpm --registry=https://registry.npm.taobao.org

node -v
