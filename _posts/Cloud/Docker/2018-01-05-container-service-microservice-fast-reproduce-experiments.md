---
layout: post
title: Container as a service for MicroService and Fast-Reproduce Experiments
date: 2018-01-05 20:32:24.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, Docker]
tags:
- dcos
- docker
- Kubernetes
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---

## Container Platform

1.  Docker Engine
2.  rkt

_Docker Daemon -> docker images (Dockerfile) -> docker containers (MircroService) -> docker compose (Applications)_

## Common Docker Commands

    $ docker build -t tagname (build docker image from docker file)

    $ docker images

check running containers

    $ docker ps

    $ docker stats

check container log

    $ docker logs

check docker host information   

    $ docker info

_You can docker images in Docker Hub / Docker Store_

_Distributed Container Management, Life-cycle Management, Scale and Orchistraion Tool_

1.  Docker Swarm
2.  Apache Mesos -> DC/OS
3.  Kubernetes (hot)
