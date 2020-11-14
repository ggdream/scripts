#!/bin/bash
NAME=core
MAIN=main.go
TARGET=dist



export GOOS=darwin
export CGO_ENABLED=1

build() {
    export GOARCH=${cpu_arch[$1]}
    if [[ $1 -eq "arm" ]] || [[ $1 -eq "arm64" ]]; then
    	export CC=$GOROOT/misc/ios/clangwrap.sh
    	export CXX=$GOROOT/misc/ios/clangwrap.sh
    fi

    echo ">> $1"
    go build -buildmode=c-archive -o $TARGET/$1/lib$NAME.a $MAIN || exit -1
    echo "<< $1"
}


declare -A cpu_arch=(["armv7-a"]="arm" ["armv8-a"]="arm64" ["x86"]="386" ["x86_64"]="amd64")



#build armv7-a
build armv8-a
#build x86
build x86_64
