#!/bin/bash


version=2.10.4
location=/usr/local
target=$HOME/.bashrc

wget -c https://storage.googleapis.com/dart-archive/channels/stable/release/$version/sdk/dartsdk-linux-x64-release.zip

sudo apt install unzip -y
sudo unzip -d $location dartsdk-linux-x64-release.zip

echo "export PUB_HOSTED_URL=https://pub.flutter-io.cn" >> $target
echo "export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn" >> $target
echo "export PUB_CACHE=$location/dart-sdk/cache" >> $target
echo "export PATH=$PATH:$location/dart-sdk/bin" >> $target
source $HOME/.bashrc


dart --version


# sudo apt-get update
# sudo apt-get install apt-transport-https -y
# sudo sh -c 'wget -qO- https://dl.google.com/linux/linux_signing_key.pub | apt-key add -'
# sudo sh -c 'wget -qO- https://storage.flutter-io.cn/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

# sudo apt-get update && sudo apt-get install dart
# echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> /etc/profile
