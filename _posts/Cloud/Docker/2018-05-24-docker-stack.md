---
layout: post
title: Docker Swarm and Stack on Single Server
date: 2018-05-24 14:43:17.000000000 +08:00
type: post
categories: [Cloud, Docker]
author: yylhome
---

## Create VMs

    $ docker-machine create node1 (can specify cpu and memory)

    $ docker-machine create node2

    $ docker-machine create node3


## Create Docker Swarm

Host as manager (on host)

    $ docker swarm init --advertise-addr x.x.x.x

VMs as workers (on vms)

    $ docker swarm join --token <insert-manager-join-token> <IP-and-port>

    $ docker node ls


## Build image and push to docker.io

    $ docker-compose build

    $ docker login

    $ docker tag image yylonly/image

    $ docker push yylonly/image


## Deploy your application to docker Swarm

    $ docker stack deploy -c docker-stack.yml application_name

    $ docker stack ls

list service in applications

    $ docker service ls

list service deployment on cluster

    $ docker stack ps application_name
