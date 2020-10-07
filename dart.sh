#!/bin/sh

default_version=2.10.1
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

sudo wget -c https://storage.googleapis.com/dart-archive/channels/stable/release/$version/sdk/dartsdk-linux-x64-release.zip
sudo unzip -d $location dartsdk-linux-x64-release.zip

sudo echo "export PUB_HOSTED_URL=https://pub.flutter-io.cn" >> $target
sudo echo "export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn" >> $target
sudo echo "export PUB_CACHE=$location/dart-sdk/cache" >> $target
sudo echo "export PATH=$PATH:$location/dart-sdk/bin" >> $target

. $target
dart -v


# sudo apt-get update
# sudo apt-get install apt-transport-https -y
# sudo sh -c 'wget -qO- https://dl.google.com/linux/linux_signing_key.pub | apt-key add -'
# sudo sh -c 'wget -qO- https://storage.flutter-io.cn/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

# sudo apt-get update && sudo apt-get install dart
# echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> /etc/profile
