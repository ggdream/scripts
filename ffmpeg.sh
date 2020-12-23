#!/bin/bash
# ubuntu 20.04


version=n4.3.1
location=/usr/local/ffmpeg
target=$HOME/.bashrc

sudo apt install -y build-essential autoconf automake cmake libtool git checkinstall nasm yasm clang pkg-config \
libsdl2-dev libx264-dev libx265-dev libvorbis-dev libvpx-dev libopus-dev libnuma-dev libfdk-aac-dev libmp3lame-dev libspeex-dev

git clone -b $version https://github.com.cnpmjs.org/FFmpeg/FFmpeg.git
cd FFmpeg/

./configure --prefix=$location \
--enable-shared \
--disable-static \
--enable-libfdk-aac \
--enable-libmp3lame \
--enable-libopus \
--enable-libvorbis \
--enable-libvpx \
--enable-libx264 \
--enable-libx265 \
--enable-gpl \
--enable-nonfree \
--enable-version3 \
--enable-libspeex

make -j$(cat /proc/cpuinfo| grep "processor"| wc -l) && sudo make install

sudo echo $location/lib > /etc/ld.so.conf.d/ffmpeg.conf
ldconfig


ffmpeg -version
