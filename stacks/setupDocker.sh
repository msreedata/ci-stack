alias h=history

#install docker on machine
sudo yum -y install wget
wget -qO- https://get.docker.com/ | sh
sudo docker version

#enable service
sudo systemctl enable docker
sudo systemctl start docker

#enable swarm
#sudo docker swarm init
