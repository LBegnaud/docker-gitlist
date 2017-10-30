#!/bin/bash

## include a paramter of
# 1) the git url to clone
# 2) the folder to clone into under /home/git/repositories
## push will be disabled
url=$1

cd /home/git/repositories
dir=$2
mkdir "$dir"
if [ -d "$dir" ]
then
    echo "clone directory name was provided"
else
    dir=${$url##*/}
fi

git clone $url $dir
cd $dir
git remote set-url --push origin PUSH-DISALLOWED

