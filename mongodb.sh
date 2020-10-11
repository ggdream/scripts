#!/bin/sh


default_version=4.4


if [ -n "$1" ] ;then
    version=$1
else
    echo "\e[31;40;1mYou have not entered any parameters, v$default_version will be selected by default.\e[0m"
    version=$default_version
fi

wget -qO - https://www.mongodb.org/static/pgp/server-$version.asc | sudo apt-key add -
echo "deb https://mirrors.tuna.tsinghua.edu.cn/mongodb/apt/ubuntu bionic/mongodb-org/$version multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-$version.list # 18.04
# echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/$version multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-$version.list  # 20.04


sudo apt-get update && sudo sudo apt-get install -y mongodb-org
# sudo apt-get update && sudo sudo apt-get install -y mongodb-org=4.4.1 mongodb-org-server=4.4.1 mongodb-org-shell=4.4.1 mongodb-org-mongos=4.4.1 mongodb-org-tools=4.4.1




# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/