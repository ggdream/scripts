#!/bin/sh
# ubuntu 18.04

version=3.8.5
location=/usr/local/python


sudo apt install -y zlib1g-dev gcc make build-essential libssl-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev openssl

sudo wget https://npm.taobao.org/mirrors/python/$version/Python-$version.tgz
tar -zxvf Python-$version.tgz
cd Python-$version/

./configure --prefix=$location
sudo make -j4 && sudo make install

sudo rm -rf /usr/bin/pip3 /usr/bin/python3
sudo ln -s $location/bin/pip3 /usr/bin/pip3
sudo ln -s $location/bin/python3 /usr/bin/python3

sudo cp /usr/lib/python3/dist-packages/lsb_release.py $location/lib/python3.8/
sudo pip3 config set global.index-url https://mirrors.aliyun.com/pypi/simple
sudo python3 -m pip install --upgrade pip
