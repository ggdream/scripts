#!/bin/sh


echo "\e[31;40;1mStarting...\e[0m"

for i in $@ ;do
    wget https://cdn.jsdelivr.net/gh/ggdream/scripts@main/$i
    sh $i
done

echo "\e[31;40;1mDone.\e[0m"