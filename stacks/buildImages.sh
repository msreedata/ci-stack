#!/bin/bash
if [[ $projectDir && -d $projectDir ]];then
    pushd $projectDir #$HOME/dockerstore/ci-stack

    #build php
    sudo docker build --no-cache ./rest-client-node -t linBox:5000/restnode:v2.0.2
    #sudo docker build --no-cache ./rest-api-dotnet -t linBox:5000/restdotnet:v2

    #push image to registry
    sudo docker push linBox:5000/restnode:v2.0.2

    popd 

    sudo docker image ls
else
    echo "...skipping Build Image."
fi