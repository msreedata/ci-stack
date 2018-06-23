#!/bin/bash

#initialize repo with folders and pull latest from git remote
#This will be already done by CI #. ./stacks/initRepo.sh
projectDir=$(pwd)

#install trusted certificate
sudo mkdir -p /etc/docker/certs.d/linBox:5000
sudo cp ./stacks/linBox.crt /etc/docker/certs.d/linBox:5000/ca.crt

#build latest docker image for testing
echo "Project path :  $projectDir"
sudo docker build --no-cache ./rest-client-node -t linBox:5000/restnode:v2
sudo docker build --no-cache ./rest-api-dotnet -t linBox:5000/restdotnet:v2

#push image to registry
sudo docker push linBox:5000/restnode:v2
sudo docker push linBox:5000/restdotnet:v2

#update stack with new image
echo "Project path :  $projectDir"
. ./stacks/runStack.sh

