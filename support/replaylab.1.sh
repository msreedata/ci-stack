  1  docker version
    2  sudo docker swarm init
    3  exit
    4  ls
    5  #!/bin/bash
    6  basedir=$HOME/dockerstore
    7  gitproject=hello-Stack
    8  gitrepourl=https://github.com/msreedata/${gitproject}.git
    9  projectDir="$basedir/$gitproject"
   10  mkdir -p $basedir
   11  if [ ! -d $projectDir ]; then         echo "missing project dir, clone now...$projectDir";         git clone $gitrepourl $projectDir; fi
   12  pushd $projectDir
   13  echo pulling code..
   14  git pull
   15  popd
   16  git
   17  sudo yum install -y git
   18  #!/bin/bash
   19  basedir=$HOME/dockerstore
   20  gitproject=hello-Stack
   21  gitrepourl=https://github.com/msreedata/${gitproject}.git
   22  projectDir="$basedir/$gitproject"
   23  mkdir -p $basedir
   24  if [ ! -d $projectDir ]; then         echo "missing project dir, clone now...$projectDir";         git clone $gitrepourl $projectDir; fi
   25  pushd $projectDir
   26  echo pulling code..
   27  git pull
   28  popd
   29  ls
   30  cd dockerstore/
   31  ls
   32  git clone https://github.com/msreedata/ci-stack.git
   33  ls
   34  ls .ssh/
   35  ls .ssh/ -hal
   36  ls .ssh/authorized_keys -hal
   37  cat .ssh/authorized_keys
   38  sudo yum -y install java
   39  git version
   40  docker version
   41  sudo docker version
   42  ip a
   43  ping lincent2
   44  sudo docker run swarm list
   45  sudo docker ps
   46  sudo docker ps -a
   47  sudo docker rm a9ed
   48  sudo docker swarm
   49  sudo docker swarm join-token
   50  sudo docker swarm join-token worker
   51  sudo docker swarm join-token manager
   52  ls
   53  cd dockerstore/
   54  ls
   55  cd hello-Stack/
   56  git pull
   57  ls
   58  . ./stacks/refresh.sh
   59  docker service ls
   60  sudo docker service ls
   61  sudo docker ps
   62  sudo docker ps -a
   63  sudo docker ls
   64  sudo docker stack ls
   65  sudo docker service ls
   66  cd ..
   67  cd ci-stack/
   68  . ./stacks/initRepo.sh
   69  . ./stacks/buildImages.sh
   70  . ./stacks/runStack.sh
   71  sudo docker services ls
   72  sudo docker service ls
   73  . ./stacks/refresh.sh
   74  sudo docker service ls
   75  sudo docker stack ls
   76  sudo docker stack rm hellov2
   77  sudo docker stack ls
   78  . ./stacks/refresh.sh
   79  . ./stacks/runStack.sh
   80  sudo docker stack ls
   81  . ./stacks/refresh.sh
   82  exit
   83  dotnet --version
   84  exit
   85  ls
   86  cd dockerstore/
   87  ls
   88  cd ci-stack/
   89  ls
   90  git pull
   91  ls
   92  ls rest-api-dotnet/
   93  . ./stacks/refresh.sh
   94  sudo docker service ls
   95  history 1000
