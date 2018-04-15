---
layout: post
title: update error for ipv6
date: 2014-10-11 23:47:30.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- ipv6
- update
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  geo_public: '0'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<ul>
<li>disable ipv6</li>
</ul>
<p>[code lang=bash]<br />
sudo vim /etc/sysctl.conf</p>
<p>net.ipv6.conf.all.disable_ipv6 = 1<br />
net.ipv6.conf.default.disable_ipv6 = 1<br />
net.ipv6.conf.lo.disable_ipv6 = 1</p>
<p>sysctl -p<br />
sysctl -a | grep diable<br />
[/code]</p>
<ul>
<li>update</li>
</ul>
<p>[code lang=bash]<br />
apt-get update<br />
apt-get dist-upgrade (update new additional packages)<br />
[/code]</p>
