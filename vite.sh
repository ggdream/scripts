#!/bin/bash


create-vite-app $1
cd $1

cnpm i
cnpm i -D typescript sass-loader sass
cnpm i -S vue-router@next vuex@next element-plus

tsc --init
