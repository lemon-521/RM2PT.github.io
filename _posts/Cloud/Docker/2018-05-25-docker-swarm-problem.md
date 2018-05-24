---
layout: post
title: Docker Swarm Issues
date: 2018-05-25 14:43:17.000000000 +08:00
type: post
categories: [Cloud, Docker]
author: yylhome
---

## Docker Swarm

_Host as Manager, VMs as workers_

## Problems

Service Discovery and connect error in differnent nodes

## Solutions

    $ docker swarm init --advertise-addr *ip*

*ip* must be same as docker machine network, but the public ip of server
