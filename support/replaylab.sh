#from main machine
    1  ls
    2  mkdir keys
    3  ls
    4  ls keys/
    5  sudo sh -c "echo '$(whoami) ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"
    6  sudo yum -y install java
    7  sudo yum -y install git
    8  sudo yum -y install wget
    9  sudo wget -qO- https://get.docker.com/ | sh
   10  sudo usermod -aG docker $(whoami)
   11  sudo docker version
   12  sudo systemctl enable docker
   13  sudo systemctl start docker
   14  sudo systemctl status docker


# Create the docker Registry as a service on Docker Swarm
# Initialize the Docker Swarm
# Specify the TLS key and certificate included in keys folder
sudo docker swarm init
sudo docker service create --name smregistry --publish=5000:5000  --constraint=node.role==manager  --mount=type=bind,src=/home/linuxadmin/keys,dst=/certs  -e REGISTRY_HTTP_ADDR=0.0.0.0:5000  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/linBox.crt  -e REGISTRY_HTTP_TLS_KEY=/certs/linBox.key  registry:latest
# verify service 
sudo docker service ls


   20  if hostnamectl | grep -q CentOS; then      echo "Centos detected"     sudo yum install -y git;     sudo yum install -y ansible;     sudo yum install -y sshpass; else      echo "Ubuntu detected";     sudo apt-get -y install ansible;     sudo apt-get -y install sshpass; fi

# verify ansible install
 ansible --version


   23  hostnamectl
   24  ls
   25  ls keys/

# cloning hello-stack project

   26  #!/bin/bash
   27  basedir=$HOME/dockerstore
   28  gitproject=hello-Stack
   29  gitrepourl=https://github.com/msreedata/${gitproject}.git
   30  projectDir="$basedir/$gitproject"
   31  mkdir -p $basedir
   32  if [ ! -d $projectDir ]; then         echo "missing project dir, clone now...$projectDir";         git clone $gitrepourl $projectDir; fi
   33  pushd $projectDir
   34  echo pulling code..
   35  git pull
   36  popd
   37  ls
   38  cd dockerstore/
   39  ls
   40  sudo sh -c "echo '$(whoami) ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"
   41  sudo yum -y install java
   42  sudo yum -y install git
   43  sudo yum -y install wget
   44  sudo wget -qO- https://get.docker.com/ | sh
   45  sudo usermod -aG docker $(whoami)
   46  sudo docker version
   47  sudo systemctl enable docker
   48  sudo systemctl start docker
   49  sudo systemctl status docker
   50  sudo docker swarm init
   51  hostname
   52  exit
   53  history 200
   54  docker version
   55  docker ps -a
   56  ping linBox
   57  ip a
   58  hostnamectl
   59  ls
   60  ls dockerstore/
   61  sudo docker
   62  docker --version
   63  docker service ls
   64  ansible -version
   65  ansible --version
   66  cd dockerstore/
   67  ls
   68  git clone https://github.com/msreedata/ci-stack.git
   69  ls
   70  cd ci-stack/
   71  cd ..
   72  cd hello-Stack/
   73  ls
   74  cd ansible/
   75  ls
   76  nano labAzureSystems
   77  export ANSIBLE_HOST_KEY_CHECKING=False
   78  docker stack ls
   79  docker service ls
   80  cd ~/dockerstore/
   81  git clone https://github.com/msreedata/swarm-registry.git
   82  ls
   83  ls swarm-registry/
   84  nano swarm-registry/Stackfile-registry.yml
   85  ping liBox
   86  hostname
   87  ping linBox
   88  cd hello-Stack/
   89  cd ansible/
   90  ls
   91  nano configDocker.yml
   92  nano configDocker.sh
   93  nano ansible.cfg
   94  nano labAzureSystems
   95  ansible-playbook configDocker.yml --ask-pass
   96  ansible-playbook configDocker.yml --ask-pass --ask-become-pass
   97  ls
   98  ansible-playbook insDocker1.yml --ask-pass --ask-become-pass
   99  pwd
  100  ansible-playbook insDocker1.yaml --ask-pass --ask-become-pass
  101  nano insDocker1.
  102  nano insDocker1.yaml
  103  nano ansible.cfg
  104  nano labAzureSystems
  105  ansible-playbook insDocker1.yaml --ask-pass --ask-become-pass
  106  ansible-playbook configDocker.yml --ask-pass --ask-become-pass
  107  ssh lincent1
  108  nano configDocker.sh
  109  ansible-playbook configDocker.yml --ask-pass --ask-become-pass
  110  docker swarm node ls
  111  ssh lincen1
  112  ssh lincent1
  113  ls
  114  nano one.sh
  115  cd ..
  116  ls
  117  sudo docker run -d --name myjenkins -p 8080:8080 -p 50000:50000 --env JAVA_OPTS=-Dhudson.footerURL=http://smlabs.net jenkins/jenkins:lts
  118  docker ps
  119  docker exec -it myjenkins bash
  120  ls
  121  ls .ssh
  122  ls ~/.ssh
  123  ls ~/.ssh/authorized_keys
  124  cat ~/.ssh/authorized_keys
  125  ls ~/keys/
  126  ssh-copy-id -f -i ~/keys/msreedata.pub lincent1
  127  ssh-copy-id -f -i ~/keys/msreedata.pub lincent2
  128  ls
  129  cd ~
  130  ls
  131  ls keys/
  132  nano linBox.crt
  133  nano keys/linBox.crt
  134  nano keys/linBox.key
  135  nano keys/msreedata.pub
  136  ssh lincent1
  137  ls
  138  cd dockerstore/
  139  ls
  140  cd hello-Stack/
  141  ls
  142  cd ansible/
  143  ls
  144  nano configDocker.sh
  145  cd ..
  146  ssh lincent1
  147  exit
  148  dotnet --version
  149  ssh lincent1
  150  ssh lincent2
  151  ssh lincent1
  152  history 1000
