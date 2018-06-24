#!/bin/bash
if [[ $projectDir && -d $projectDir ]];then
    pushd $projectDir #$HOME/dockerstore/ci-stack

    #build php
    # sudo docker build --no-cache ./rest-client-node -t linBox:5000/restnode:v2.1.1
    # sudo docker build --no-cache ./rest-api-dotnet -t linBox:5000/restdotnet:v2.1.1

    sudo docker build ./rest-client-node -t linBox:5000/restnode:v2.1.2
    sudo docker build ./rest-api-dotnet -t linBox:5000/restdotnet:v2.1.2

    #enable this during testing only
    # sudo docker build --no-cache ./rest-client-node -t restnode:v2.0.3
    # sudo docker tag restnode:v2.0.3 linBox:5000/restnode:v2.0.3
    # sudo docker push linBox:5000/restnode:v2.0.3

    #push image to registry
    # sudo docker push linBox:5000/restnode:v2.1.1
    # sudo docker push linBox:5000/restdotnet:v2.1.1

    popd 

    sudo docker image ls
else
    echo "...skipping Build Image."
fi