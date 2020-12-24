#!/bin/bash


version=8u202
prefix=${version}-b08
location=/usr/local
target=$HOME/.bashrc

wget -c https://repo.huaweicloud.com/java/jdk/${prefix}/jdk-${version}-linux-x64.tar.gz
sudo tar -zxvf jdk-${version}-linux-x64.tar.gz -C $location
sudo mv ${location}/jdk1.8.0_202 ${location}/jdk

echo "export JAVA_HOME=${location}/jdk" >> $target
echo "export JRE_HOME=${location}/jdk/jre" >> $target
echo "export PATH=\$PATH:\${JAVA_HOME}/bin:\${JRE_HOME}/bin" >> $target
source $target


java -version
