#!/bin/sh



# docker
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

sudo curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update && sudo apt-get install docker-ce -y

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
 "registry-mirrors": [
     "https://reg-mirror.qiniu.com",
     "https://hub-mirror.c.163.com",
     "https://bmtb46e4.mirror.aliyuncs.com"
     ]
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker


# docker-compose
# sudo apt install -y python3-pip
# sudo pip3 install -i https://mirrors.aliyun.com/pypi/simple docker-compose
curl -L "https://github.91chifun.workers.dev//https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


docker -v && docker-compose -v
