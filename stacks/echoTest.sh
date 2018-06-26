#!/bin/bash
#get parameters
while getopts p:d:t:r: option
do
case "${option}"
in
p) PROJECT=${OPTARG};;
# boolean
b) BUILD=${OPTARG};;
t) TEST=${OPTARG};;
d) DEPLOY=${OPTARG};;
# value variables
m) MODULE=${OPTARG};;
r) REVISION=$OPTARG;;
esac
done

echo "************** project=${PROJECT}"
echo "************** deploy=${BUILD}"
echo "************** deploy=${TEST}"
echo "************** deploy=${DEPLOY}"
#
echo "************** module=${MODULE}"
echo "************** revision=${REVISION}"



#initialize repo with folders and pull latest from git remote
#This will be already done by CI #. ./stacks/initRepo.sh
projectDir=$(pwd)

    # define versions
    rest_api_version=v2.3.21
    rest_client_version=v2.3.21

#install trusted certificate
certfile=/etc/docker/certs.d/linBox:5000/ca.crt
if [ ! -e "$certfile" ]; then
    echo "Installing ca Certificate"
    sudo mkdir -p /etc/docker/certs.d/linBox:5000
    sudo cp ./stacks/linBox.crt ${certfile}
else 
    echo "ca Certificate is already registered"
fi 

#build latest docker image for testing
echo "Project path :  $projectDir"
# sudo docker build ./rest-api-dotnet -t linBox:5000/restdotnet:${rest_api_version}
# sudo docker build ./rest-client-node -t "linBox:5000/restnode:${rest_client_version}"

#push image to registry
echo "Pushing image :  $projectDir"
# sudo docker push linBox:5000/restdotnet:${rest_api_version}
# sudo docker push linBox:5000/restnode:${rest_client_version}

#update stack with new image
echo "Deploying stack on Docker Swarm :  $projectDir"
#. ./stacks/runStack.sh

echo "------------ END of test batch ----------"
