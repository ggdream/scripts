#!/bin/sh



# docker
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

sudo curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update && sudo apt-get -y install docker-ce

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
 "registry-mirrors": ["https://bmtb46e4.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker


# docker-compose
sudo apt install -y python3-pip
sudo pip3 install -i https://mirrors.aliyun.com/pypi/simple docker-compose