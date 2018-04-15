---
layout: post
title: 'reverse SSH: access HTTP server in intranet'
date: 2014-01-05 08:37:09.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags: []
meta:
  _publicize_pending: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>Use ssh open a new port on server forward request to the port on intranet server though ssh</p>
<p>new port on public server -&gt; ssh port on server ========= ssh port on intranet -&gt; port on intranet</p>
<p>Log in your intranet server</p>
<p>1. copy public key to server have public server<span style="color:#ff0000;">  (begin ssh-rsa and need one line and putty-gen rsa2 2048)</span></p>
<p>2. copy this in /etc/rc.local</p>
<p>ssh -NfR 8080:localhost:80 yylonly@54.254.186.220<br />
ssh -NfR 40000:localhost:40000 yylonly@54.254.186.220</p>
<p>3. test</p>
<p>when you reach 8080 on public server it will forward to 80 on intranet server though SSH tunel</p>
<p><span style="color:#ff0000;">note: need GatewayPorts yes on the service ssh configure /etc/ssh/sshd_config, then it can listen on 0.0.0.0</span></p>
