#!/bin/bash
# ubuntu 20.04


version=3.8.7
location=/usr/local/python
target=$HOME/.bashrc

sudo apt install -y zlib1g-dev gcc make build-essential libssl-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev openssl

wget -c https://npm.taobao.org/mirrors/python/$version/Python-$version.tgz
tar -zxvf Python-$version.tgz
cd Python-$version/

./configure --prefix=$location
make -j$(cat /proc/cpuinfo| grep "processor"| wc -l) && sudo make install

sudo ln -s $location/bin/pip3 /usr/local/bin/pip3.8
sudo ln -s $location/bin/python3 /usr/local/bin/python3.8


pip3.8 config set global.index-url https://mirrors.aliyun.com/pypi/simple
pip3.8 install --upgrade pip

python3.8 -V
