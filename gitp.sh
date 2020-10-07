#!/bin/sh

git init && git add . && git commit -m $1
git remote add origin $2
git push -f origin main