#!/bin/bash
sudo docker version
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker


if sudo docker node ls > /dev/null 2>&1; then
  echo This node is already in Docker Swarm as Master
else
  echo Joining Docker Swarm as worker now...
  sudo docker swarm leave -f
  sudo docker swarm join --token SWMTKN-1-3sndwffbtu06hq1ae29yawixo40pdia868mkx68lw0smbisprp-eurr43a1zqn5jh52bgoewh69h 10.1.1.5:2377
fi

#sudo docker swarm join --token SWMTKN-1-1po4t8ubgbt392lmmuaygghg4fw41oa7x38akwte1rszo6ru1t-20egvk68pk9c6padud12tqtm8 10.1.1.4:2377
#echo "asdfasdf"
#echo "asdfasdfdeeeeeeee"