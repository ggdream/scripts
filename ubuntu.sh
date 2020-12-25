#!/bin/bash


sudo mv /etc/apt/sources.list /etc/apt/sourses.list.backup

CODE=$(lsb_release -c | awk '{ print $(NF) }')
sudo cat > /etc/apt/sources.list <<EOF
deb http://mirrors.aliyun.com/ubuntu/ $CODE main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $CODE-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $CODE-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $CODE-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $CODE-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $CODE main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $CODE-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $CODE-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $CODE-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $CODE-backports main restricted universe multiverse
EOF


# sudo sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
apt update && sudo apt upgrade -y
