#!/bin/sh

default_version=10.2.0


if [ -n "$1" ] ;then
    version=$1
else
    echo "\e[31;40;1mYou have not entered any parameters, v$default_version will be selected by default.\e[0m"
    version=$default_version
fi

sudo wget -c https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-$version/gcc-$version.tar.gz
sudo tar -zxvf gcc-$version.tar.gz

cd gcc-$version/
./contrib/download_prerequisites
sudo mkdir gcc_build
cd gcc_build

../configure -enable-checking=release -enable-languages=c,c++ -disable-multilib
sudo make -j4 && sudo make install