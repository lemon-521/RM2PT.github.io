---
layout: post
title: LiveSteam from PS4 to RTMP server
date: 2017-04-01 16:54:33.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Others, Game]
tags:
- ps4
- rtmp
meta:
  _wpcom_is_markdown: '1'
  _edit_last: '1'
  _wpas_done_all: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p><strong>Preliminary: one Pi server, one PS4 with twitch live ready</strong></p>
<ol>
<li>Install <a href="https://github.com/arut/nginx-rtmp-module">RTMP</a> with Nginx on Pi</li>
<li>
<p>Enable IP forward on Pi</p>
</li>
<li>
<p>edit iptables</p>
</li>
</ol>
<p><code>iptables -t nat -A PREROUTING -s 192.168.0.4/32 -p tcp -m tcp --dport 1935 -j DNAT --to-destination 192.168.0.6:1935</code><br />
<code>iptables -t nat -A POSTROUTING -s 192.168.0.4/32 -j MASQUERADE</code></p>
<ol>
<li>PS4 gateway must be RTMP server or forward to RTMP server setting on gateway</li>
</ol>
<p>Now, steam on PS4 will automatic forward to your RTMP server</p>
