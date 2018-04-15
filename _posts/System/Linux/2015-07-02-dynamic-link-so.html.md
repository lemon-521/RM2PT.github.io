---
layout: post
title: dynamic link .so
date: 2015-07-02 03:15:25.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- ldd
- linux
- so
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_job_id: '12225475770'
  _edit_last: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>Display all so in system</h2>
<ul>
<li>ldconfig -p | grep xx</li>
</ul>
<p><span style="font-size: 29px; font-weight: bold;">Show all .so required</span></p>
<ul>
<li>ldd runningfile</li>
</ul>
<h2>.so path</h2>
<ul>
<li>/etc/ld.so.conf</li>
</ul>
<h2>reload</h2>
<ul>
<li>ldconfig</li>
</ul>
<p>set more export LD_LIBRARY_PATH=xxx</p>
