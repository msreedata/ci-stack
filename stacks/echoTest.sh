#!/bin/bash
#get parameters
for ARGUMENT in "$@"
do

    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    KEY="${KEY,,}"
    KEY="${KEY/--/}"

    VALUE=$(echo $ARGUMENT | cut -f2 -d=)
    case "$KEY" in
            project)    project=${VALUE} ;;
            revision)   revision=${VALUE} ;;
            build)      build=${VALUE} ;;
            test)       test=${VALUE} ;;
            deploy)     deploy=${VALUE} ;;
            module)     module=${VALUE} ;;
            testing)   testing=${VALUE} ;;
            notify)   notify=${VALUE} ;;
            notes)      notes=${VALUE} ;;
            *)
    esac

done

echo "------------ START of test batch ----------"

systemname=$(hostname -f)
echo "Executing Jenkins job on server : ${systemname}"

echo "******** project = ${project}"
echo "******** revision = ${revision}"
#
echo "******** build = ${build}"
echo "******** test = ${test}"
echo "******** deploy = ${deploy}"
#
echo "******** module = ${module}"
echo "******** testing = ${testing}"
echo "******** notify = ${notify}"
echo "******** notes = ${notes}"



#initialize repo with folders and pull latest from git remote
#This will be already done by CI #. ./stacks/initRepo.sh
projectDir=$(pwd)

    # define versions
    rest_api_version=v2.3.41
    rest_client_version=v2.3.41

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
echo "demo only--- Project path :  $projectDir"
# sudo docker build ./rest-api-dotnet -t linBox:5000/restdotnet:${rest_api_version}
# sudo docker build ./rest-client-node -t "linBox:5000/restnode:${rest_client_version}"

#push image to registry
echo "demo only--- Pushing image :  $projectDir"
# sudo docker push linBox:5000/restdotnet:${rest_api_version}
# sudo docker push linBox:5000/restnode:${rest_client_version}

#update stack with new image
echo "demo only--- Deploying stack on Docker Swarm :  $projectDir"
#. ./stacks/runStack.sh

echo "------------ END of test batch ----------"
