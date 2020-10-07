#!/bin/sh


echo "\e[31;40;1mStarting...\e[0m"
sleep 1s

for i in $@ ;do
    wget https://cdn.jsdelivr.net/gh/ggdream/scripts@main/$i.sh
    sh $i.sh
done

echo "\e[31;40;1mDone.\e[0m"
sudo rm -rf *