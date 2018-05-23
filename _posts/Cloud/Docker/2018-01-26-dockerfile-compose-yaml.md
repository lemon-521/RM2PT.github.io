---
layout: post
title: Dockerfile and Compose.yaml
date: 2018-01-26 14:43:17.000000000 +08:00
type: post
status: publish
categories: [Cloud, Docker]
author: yylhome
---

Dockerfile
==========

Docker-file describes two stages:

* how to build a images (Focus on build the runtime)

      FROM :  base-images

      ENV,  ADD/COPY, RUN

* how to start up a container (Focus on deploy, run the services)

        EXEC\["command", "parameters", ....\]  (run bash default) i.e. CMD []

        ENTRYPOINT\["/xxx.sh"\]

### Build the Image from Dockerfile

    $ docker build . -t xxxx

### Run Container from images

    $ docker run --name container_name -p localport:containerport -v /localpath:/containerpath --envs XXX=XXX -itd imagename

when you exit from container, the container will be stopped.

but you can start and attach to it.

    $ docker ps -a (find the container name)
    $ docker start container_name
    $ docker attach container_name

However, container often start a service in bash, it blocks you input other commands. Therefore, you can execute another bash to execute commands.

    $ docker exec -it container_name commands
    $ docker exec -it container_name bash

The container can depend each other by --link, it will add the depended container name into the /etc/hosts, then you can use hostname to assign an container to another without expose port to hosts. The docker compose make it more convenient.

Compose.yaml
============

Compose can help your run multiple docker container at the same times. all the parameters can be store in compose.yaml. E.g.

    =================================  
    version: '3'

    services:

      glassfish:

      build: .

      ports:

        - 8080:8080

        - 4848:4848

      depends_on:

        - mysql

    mysql:

      build: ./DB

      environment:

        MYSQL\_ROOT\_PASSWORD: 123456

        MYSQL_DATABASE: ehr

        MYSQL_USER: ehr

        MYSQL_PASSWORD: ehr

        MYSQL\_ROOT\_HOST: '%'

    =====================================

### Command vs Compose File

    -p => ports:

    --envs => environment:

    docker build => build:

### yml file for docker-compose to docker stack

    --link => depends_on: (depends_on are decide running order)

### Build Images and Run Container:

    $ docker-compose build
    $ docker-compose up
    $ docker-compose down
