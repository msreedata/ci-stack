#!/bin/bash
#get parameters

for ARGUMENT in "$@"
do

    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    KEY="${KEY,,}"
    KEY="${KEY/--/}"


    VALUE=$(echo $ARGUMENT | cut -f2 -d=)

    case "$KEY" in
            project)              project=${VALUE} ;;
            build)    build=${VALUE} ;;
            test)    test=${VALUE} ;;
            deploy)    deploy=${VALUE} ;;
            module)    module=${VALUE} ;;
            revision)    revision=${VALUE} ;;
            notes)    notes=${VALUE} ;;
            *)
    esac



done

echo "************** project=${project}"
echo "************** build=${build}"
echo "************** test=${test}"
echo "************** deploy=${deploy}"
#
echo "************** module=${module}"
echo "************** revision=${revision}"



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
