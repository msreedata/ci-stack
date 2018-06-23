#!/bin/bash
basedir=$HOME/dockerstore
gitproject=ci-stack
gitrepourl=https://github.com/msreedata/${gitproject}.git
projectDir="$basedir/$gitproject"

mkdir -p $basedir
if [ ! -d $projectDir ]; then
        echo "missing project dir, clone now...$projectDir"
        git clone $gitrepourl $projectDir
fi

pushd $projectDir
echo pulling code..
git pull
popd
