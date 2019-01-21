#!/bin/bash
sudo docker version
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

sudo docker swarm leave -f
#sudo docker swarm join --token SWMTKN-1-4hy9yfngk65hyi9vf5gxttw18idp1vj6ip7mfg3j4oqoxmcl2b-802tw7jup6gx68nxbczxptm0m 10.1.1.16:2377
sudo docker swarm join --token SWMTKN-1-1po4t8ubgbt392lmmuaygghg4fw41oa7x38akwte1rszo6ru1t-20egvk68pk9c6padud12tqtm8 10.1.1.4:2377
#echo "asdfasdf"
#echo "asdfasdfdeeeeeeee"