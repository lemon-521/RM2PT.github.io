---
layout: post
title: Pi kernel upgrade
date: 2014-10-19 04:09:31.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags: []
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
<h2>rpi-update</h2>
<p>[code lang=bash]<br />
sudo curl -L --output /usr/bin/rpi-update https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update &amp;&amp; sudo chmod +x /usr/bin/rpi-update<br />
rpi-update<br />
[/code]</p>
<h2>Daily update and upgrade</h2>
<p>[code lang=bash]<br />
#!/bin/bash<br />
apt-get update<br />
apt-get upgrade -y<br />
apt-get autoclean<br />
crontab -e<br />
0 4 * * * script.sh<br />
[/code]</p>
