#!/bin/sh
# ubuntu 18.04

default_version=n4.3.1
default_location=/usr/local/ffmpeg


if [ -n "$2" ] ;then
    version=$1
    location=$2
elif [ -n "$1" ] ;then
    version=$1
    location=$default_location
else
    echo "\e[31;40;1mYou have not entered any parameters, $default_version will be selected by default.\e[0m"
    version=$default_version
    location=$default_location
fi


sudo apt install -y build-essential autoconf automake cmake libtool git checkinstall nasm yasm clang pkg-config \
libsdl2-dev libx264-dev libx265-dev libvorbis-dev libvpx-dev libopus-dev libnuma-dev libfdk-aac-dev libmp3lame-dev libspeex-dev

sudo git clone -b $version https://github.com.cnpmjs.org/FFmpeg/FFmpeg.git
cd FFmpeg/

./configure --prefix=$location \
--enable-shared \
--enable-gpl \
--enable-libfdk-aac \
--enable-libmp3lame \
--enable-libopus \
--enable-libvorbis \
--enable-libvpx \
--enable-libx264 \
--enable-libx265 \
--enable-nonfree \
--enable-libspeex \
--enable-version3 \
--enable-pthreads
sudo make -j4 && sudo make install

sudo echo $location/lib/ >> /etc/ld.so.conf
# https://video.pearvideo.com/mp4/adshort/20201006/cont-1700555-15417447_adpkg-ad_hd.mp4