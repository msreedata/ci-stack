#!/bin/bash
if [[ $projectDir && -d $projectDir ]];then
    pushd $projectDir #$HOME/dockerstore/ci-stack

    # define versions
    rest_api_version=v1.2.4
    rest_client_version=v1.4.2

    #build images with tag
    sudo docker build ./rest-api-dotnet -t linBox:5000/restdotnet:${rest_api_version}
    # sudo docker build --no-cache ./rest-client-node -t "linBox:5000/restnode:${rest_client_version}"
    sudo docker build ./rest-client-node -t "linBox:5000/restnode:${rest_client_version}"

    #enable this during testing only
    # sudo docker build --no-cache ./rest-client-node -t restnode:${rest_client_version}
    # sudo docker tag restnode:${rest_client_version} linBox:5000/restnode:${rest_client_version}
    # sudo docker push linBox:5000/restnode:${rest_client_version}

    #push image to registry
    sudo docker push linBox:5000/restdotnet:${rest_api_version}
    sudo docker push linBox:5000/restnode:${rest_client_version}

    popd 

    sudo docker image ls
else
    echo "...skipping Build Image."
fi
