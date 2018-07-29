---
layout: post
title: Eclipse Che - Cloud IDE
date: 2018-07-30
type: post
categories: [DevOps, IDE]
author: Yilong
---


### Pre-request

* Ubuntu 16.04
* Docker and Nvidia Docker
* CUDA and CuDNN

### Docker

Add new repo

```
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -   

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

Install docker CE

```
apt-get update
apt-get install docker-ce
```

Test docker

```
docker run hello-world
```

### Docker Nvidia

If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
```
docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker
```

Add the package repositories
```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
```

Install nvidia-docker2 and reload the Docker daemon configuration
```
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd
```

Test nvidia-smi with the latest official CUDA image
```
docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
nvidia-docker run --rm nvidia/cuda nvidia-smi
```

#### Set docker run default with Nvidia

Set nvidia as default runtime to be used by eclipse che
```
cat << EOF > /etc/docker/daemon.json
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
```

Restart docker daemon
```
systemctl restart docker.service
```

### Eclipse che

Single-user
```
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v /local/path:/data eclipse/che start
```

Multi-user
```
docker run -it -e CHE_MULTIUSER=true -e CHE_HOST=${EXTERNAL_IP} -v /var/run/docker.sock:/var/run/docker.sock -v /local/path:/data eclipse/che start
```

Eclipse will listen on port 8080, Keycloak on 5050 if any.

### Create Tensorflow Stack

Docker image **tensorflow/tensorflow:latest-devel-gpu-py3** with **Python language server** enabled
