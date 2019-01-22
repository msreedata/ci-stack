#!/bin/bash
sudo docker version
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

sudo docker swarm leave -f
sudo docker swarm join --token SWMTKN-1-1kure3cnvs417cj4jr5sdmw4eixtxolkf5dr613qtwu9kkbvlb-273aqk08ryqc9baht8r9eamod 10.1.1.5:2377
#sudo docker swarm join --token SWMTKN-1-1po4t8ubgbt392lmmuaygghg4fw41oa7x38akwte1rszo6ru1t-20egvk68pk9c6padud12tqtm8 10.1.1.4:2377
#echo "asdfasdf"
#echo "asdfasdfdeeeeeeee"