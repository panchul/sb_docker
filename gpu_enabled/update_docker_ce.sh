#!/bin/sh
#
# Necessary step to make nvidia-docker working.
#
# automating what is in https://docs.docker.com/engine/install/ubuntu/
#

sudo apt-get remove docker docker-engine docker.io containerd runc
# ...
sudo apt-get update
# ...
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# ...
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#ok
sudo apt-key fingerprint 0EBFCD88
#should be:
#pub   rsa4096 2017-02-22 [SCEA]
#      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
#uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
#sub   rsa4096 2017-02-22 [S]
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# ...
sudo apt-get update
# ...
sudo apt-get install docker-ce docker-ce-cli containerd.io
# ...
# This is for installing a specific version
# apt-cache madison docker-ce
# ...
#  sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
sudo docker run hello-world
# ... Hello from Docker! ...


# install nvidia-docker
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
# OK
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
echo $distribution
# should be "ubuntu18.04"
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
	  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
# ...
sudo apt-get update
# ...
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
# ...
sudo systemctl restart docker
# ...
sudo apt-get install -y nvidia-docker2
# ...
sudo docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
#Fri Apr 10 23:19:10 2020
#+-----------------------------------------------------------------------------+
#| NVIDIA-SMI 440.33.01    Driver Version: 440.33.01    CUDA Version: 10.2     |
#|-------------------------------+----------------------+----------------------+
#| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
#| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
#|===============================+======================+======================|
#|   0  Tesla K80           On   | 0000C075:00:00.0 Off |                    0 |
#| N/A   43C    P8    28W / 149W |      0MiB / 11441MiB |      0%      Default |
#+-------------------------------+----------------------+----------------------+
#
#+-----------------------------------------------------------------------------+
#| Processes:                                                       GPU Memory |
#|  GPU       PID   Type   Process name                             Usage      |
#|=============================================================================|
#|  No running processes found                                                 |
#+-----------------------------------------------------------------------------+
