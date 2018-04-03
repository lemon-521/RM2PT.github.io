---
layout: post
title: Multi CPU make
date: 2017-03-24 14:40:17.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- make
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>make -j `grep processor /proc/cpuinfo | wc -l`</p>
