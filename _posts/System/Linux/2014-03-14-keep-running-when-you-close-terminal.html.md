---
layout: post
title: keep running when you close terminal
date: 2014-03-14 02:48:43.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- screen
- ubuntu
meta:
  _publicize_pending: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>1. apt-get install screen</p>
<p>2. open screen : screen</p>
<p>3. ctrl + a :</p>
<p>c create new windows</p>
<p>n next</p>
<p>p previous</p>
<p>" see all windows</p>
<p>? help</p>
<p>k kill</p>
<p>\ kill all</p>
<p>d  detach - then you can close</p>
<p>4. screen -r  name : recovery</p>
<p>5. screen -ls : list</p>
<p>6. screen -S sessionname -p 0 -X quit</p>
