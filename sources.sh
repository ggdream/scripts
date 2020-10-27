#!/bin/sh

# sudo mv /etc/apt/sources.list /etc/apt/sourses.list.backup
# sudo tee /etc/apt/sources.list <<-'EOF'
# deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
# deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
# EOF

sudo sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y
