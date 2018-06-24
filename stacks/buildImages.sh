#!/bin/bash
if [[ $projectDir && -d $projectDir ]];then
    pushd $projectDir #$HOME/dockerstore/ci-stack

    rest_api_version=v2.2.1
    rest_client_version=v2.2.2
    #build php
    # sudo docker build --no-cache ./rest-client-node -t linBox:5000/restnode:v2.1.1
    # sudo docker build --no-cache ./rest-api-dotnet -t linBox:5000/restdotnet:v2.1.1

    sudo docker build ./rest-client-node -t "linBox:5000/restnode:${rest_api_version}"
    sudo docker build ./rest-api-dotnet -t linBox:5000/restdotnet:${rest_client_version}


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