# ubuntu 18.04
version=3.8.5
location=/usr/local/python


sudo su

apt install -y zlib1g-dev gcc make build-essential libssl-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev openssl

wget https://npm.taobao.org/mirrors/python/$version/Python-$version.tgz
tar -zxvf Python-$version.tgz
cd Python-$version/

./configure --prefix=$location
make -j4 && make install

rm -rf /usr/bin/pip3 /usr/bin/python3
ln -s $location/bin/pip3 /usr/bin/pip3
ln -s $location/bin/python3 /usr/bin/python3

cp /usr/lib/python3/dist-packages/lsb_release.py $location/lib/python3.8/
pip3 config set global.index-url https://mirrors.aliyun.com/pypi/simple
python3 -m pip install --upgrade pip