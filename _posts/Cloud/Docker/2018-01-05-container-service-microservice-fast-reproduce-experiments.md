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
<p>Container Platform</p>
<ol>
<li>Docker Engine</li>
<li>rkt</li>
</ol>
<p>Docker Daemon -&gt; docker images (Dockerfile) -&gt; docker containers (MircroService) -&gt; docker compose (Applications)</p>
<p>common docker commands</p>
<blockquote><p>docker build -t tagname (build docker image from docker file)</p>
<p>docker images</p>
<p>docker ps (check running containers)</p>
<p>docker stats</p>
<p>docker logs (check container log)</p>
<p>docker info (check docker host information)</p></blockquote>
<p>You can docker images in Docker Hub / Docker Store</p>
<p>Distributed Container Management, Life-cycle Management, Scale and Orchistraion Tool</p>
<ol>
<li>Docker Swarm</li>
<li>Apache Mesos -&gt; DC/OS</li>
<li>Kubernetes (hot)</li>
</ol>
<p>&nbsp;</p>
