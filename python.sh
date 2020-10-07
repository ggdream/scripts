#!/bin/sh
# ubuntu 18.04

default_version=3.8.5
default_location=/usr/local/python
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

sudo apt install -y zlib1g-dev gcc make build-essential libssl-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev openssl

sudo wget -c https://npm.taobao.org/mirrors/python/$version/Python-$version.tgz
tar -zxvf Python-$version.tgz
cd Python-$version/

./configure --prefix=$location
sudo make -j4 && sudo make install

# sudo rm -rf /usr/bin/pip3 /usr/bin/python3
sudo ln -s $location/bin/pip3 /usr/bin/pip3.8
sudo ln -s $location/bin/python3 /usr/bin/python3.8

echo "export PATH=$PATH:$location/bin" >> $target
. $target

# sudo cp /usr/lib/python3/dist-packages/lsb_release.py $location/lib/python3.8/
sudo pip3.8 config set global.index-url https://mirrors.aliyun.com/pypi/simple
sudo python3.8 -m pip install --upgrade pip

python3.8 -V