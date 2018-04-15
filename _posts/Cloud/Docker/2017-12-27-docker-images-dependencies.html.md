---
layout: post
title: Docker Images Dependencies
date: 2017-12-27 19:48:32.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, Docker]
tags:
- docker
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>maven:3.5.2-jdk-8-alpine -&gt; openjdk:8u121-jdk-alpine -&gt; alpine:3.7 -&gt; scratch</p>
<p>maven:3.5.2-jdk-8 -&gt; openjdk:8-jdk -&gt; buildpack-deps:stretch-scm -&gt; buildpack-deps:stretch-curl -&gt; debian:stretch -&gt; scratch</p>
