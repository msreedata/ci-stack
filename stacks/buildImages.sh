#!/bin/bash
if [[ $projectDir && -d $projectDir ]];then
    pushd $projectDir #$HOME/dockerstore/ci-stack

    #build php
    sudo docker build --no-cache ./rest-client-node -t restnode:v2
    sudo docker build --no-cache ./rest-api-dotnet -t restdotnet:v2

    sudo docker tag restnode:v2 linBox:5000/restnode:v2
    sudo docker tag restdotnet:v2 linBox:5000/restdotnet:v2

    popd 

    sudo docker image ls
else
    echo "...skipping Build Image."
fi