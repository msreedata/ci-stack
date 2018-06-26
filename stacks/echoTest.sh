#!/bin/bash

#initialize repo with folders and pull latest from git remote
#This will be already done by CI #. ./stacks/initRepo.sh
projectDir=$(pwd)

    # define versions
    rest_api_version=v2.3.20
    rest_client_version=v2.3.20

#install trusted certificate
certfile=/etc/docker/certs.d/linBox:5000/ca.crt
if [ ! -e "$certfile" ]; then
    echo "Installing ca Certificate"
    sudo mkdir -p /etc/docker/certs.d/linBox:5000
    sudo cp ./stacks/linBox.crt ${certfile}
else 
    echo "File exists"
fi 
# sudo mkdir -p /etc/docker/certs.d/linBox:5000
# sudo cp ./stacks/linBox.crt /etc/docker/certs.d/linBox:5000/ca.crt

#build latest docker image for testing
echo "Project path :  $projectDir"
sudo docker build ./rest-api-dotnet -t linBox:5000/restdotnet:${rest_api_version}
sudo docker build ./rest-client-node -t "linBox:5000/restnode:${rest_client_version}"

#push image to registry
sudo docker push linBox:5000/restdotnet:${rest_api_version}
sudo docker push linBox:5000/restnode:${rest_client_version}

#update stack with new image
echo "Project path :  $projectDir"
. ./stacks/runStack.sh

