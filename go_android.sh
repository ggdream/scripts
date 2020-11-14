#!/bin/bash
API=21
NAME=core
MAIN=main.go
TARGET=dist



export GOOS=android
export CGO_ENABLED=1

build() {
    export GOARCH=${cpu_arch[$1]}
    export CC=${cc_arch[$1]}
    export CXX=${cxx_arch[$1]}
    
    echo ">> $1"
    go build -buildmode=c-shared -o $TARGET/$1/lib$NAME.so $MAIN || exit -1
    echo "<< $1"
}


TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64
declare -A cpu_arch=(["armv7-a"]="arm" ["armv8-a"]="arm64" ["x86"]="386" ["x86_64"]="amd64")
declare -A cc_arch
cc_arch["armv7-a"]=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
cc_arch["armv8-a"]=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
cc_arch["x86"]=$TOOLCHAIN/bin/i686-linux-android$API-clang
cc_arch["x86_64"]=$TOOLCHAIN/bin/x86_64-linux-android$API-clang
declare -A cxx_arch
cxx_arch["armv7-a"]=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
cxx_arch["armv8-a"]=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
cxx_arch["x86"]=$TOOLCHAIN/bin/i686-linux-android$API-clang++
cxx_arch["x86_64"]=$TOOLCHAIN/bin/x86_64-linux-android$API-clang++



build armv7-a
build armv8-a
build x86
build x86_64
