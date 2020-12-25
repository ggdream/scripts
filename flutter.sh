#!/bin/bash


version=1.22.5
location=/usr/local
target=$HOME/.bashrc

# wget 'http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz' -O android-sdk-linux.tgz
# sudo tar -zxvf android-sdk-linux.tgz -C $location
wget -c https://mirrors.tuna.tsinghua.edu.cn/flutter/flutter_infra/releases/stable/linux/flutter_linux_$version-stable.tar.xz
sudo tar -Jxvf flutter_linux_$version-stable.tar.xz -C $location

echo "export PUB_HOSTED_URL=https://pub.flutter-io.cn" >> $target
echo "export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn" >> $target
# echo "export ANDROID_HOME=$location/android-sdk-linux" >> $target
# echo "export ANDROID_PATH=$location/android-sdk-linux/tools:$location/android-sdk-linux/platform-tools" >> $target
echo "export PATH=$PATH:$location/flutter/bin:$location/flutter/bin/cache/dart-sdk/bin" >> $target
source $HOME/.bashrc

# android list sdk --all
# android update -a -u -t 2,8,53
flutter doctor
flutter doctor --android-licenses

flutter --version
