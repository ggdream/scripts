#!/bin/sh


for i in $@ ;do
    wget https://cdn.jsdelivr.net/gh/ggdream/scripts@main/$i.sh && bash $i.sh
done

rm -rf *
