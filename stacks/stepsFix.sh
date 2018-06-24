
   96  . ./stacks/runStack.sh
   97  sudo docker stack rm restv2
   98  sudo docker run -it -p 90:4000 --name node1 linBox:5000/restnode:v2 sh
   99  sudo docker run -it -p 85:4000 --name node1 linBox:5000/restnode:v2 sh
  100  sudo docker rm node1 -f
  101  sudo docker run -it -p 91:4000 --name node1 linBox:5000/restnode:v2 sh
  102  sudo docker rm node1 -f
  103  nano stacks/Stackfile-REST.yml
  104  . ./stacks/runStack.sh
  105  sudo docker stack rm restv2
  106  sudo docker run -it -p 91:4000 --name node1 linBox:5000/restnode:v2 sh



   85  sudo docker stack rm restv2
   86  sudo docker
   87  sudo docker run -it -p 5001:5001 --name node1 linBox:5000/restdotnet:v2 sh
   88  docker rm -f node1
   89  sudo docker rm -f node1



#buiding new image
    sudo docker build --no-cache ./rest-client-node -t restnode:v2.0.1
    sudo docker tag restnode:v2.0.1 linBox:5000/restnode:v2.0.1
    sudo docker push linBox:5000/restnode:v2.0.1