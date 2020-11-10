#!/bin/sh

default_version=1.22.3
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

sudo wget -c https://mirrors.tuna.tsinghua.edu.cn/flutter/flutter_infra/releases/stable/linux/flutter_linux_$version-stable.tar.xz
sudo wget 'http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz' -O android-sdk-linux.tgz
sudo tar -Jxvf flutter_linux_$version-stable.tar.xz -C $location
sudo tar -zxvf android-sdk-linux.tgz -C $location

sudo echo "export PUB_HOSTED_URL=https://pub.flutter-io.cn" >> $target
sudo echo "export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn" >> $target
sudo echo "export ANDROID_HOME=$location/android-sdk-linux" >> $target
sudo echo "export ANDROID_PATH=$location/android-sdk-linux/tools:$location/android-sdk-linux/platform-tools" >> $target
sudo echo "export PATH=$PATH:$location/flutter/bin:$location/flutter/bin/cache/dart-sdk/bin:$location/android-sdk-linux/tools:$location/android-sdk-linux/platform-tools" >> $target
. $target

android list sdk --all
android update -a -u -t 2,8,53
flutter doctor --android-licenses

flutter doctor
