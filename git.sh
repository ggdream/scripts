#!/bin/sh
# ubuntu 18.04
sudo apt install -y git


if [ ! -n "$2" ] ;then
    echo "\e[36;40;1mBecause you have no input parameters, you have to manually set the user name and email.\e[0m"
else
    sudo git config --global user.name  $1
    sudo git config --global user.email $2
fi