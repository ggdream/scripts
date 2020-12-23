@echo off


call create-vite-app %1
cd %1

call cnpm i
call cnpm i -D typescript sass-loader sass
call cnpm i -S vue-router@next vuex@next element-plus

tsc --init
