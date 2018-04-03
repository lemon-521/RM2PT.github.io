---
layout: post
title: OpenVPN(SSL/TLS) for PS4
date: 2017-04-01 15:29:07.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Others, Game]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _edit_last: '1'
  _oembed_bdad4f52f3f03c988e3348a80dd0f501: "{{unknown}}"
  _wpas_done_all: '1'
  _jetpack_dont_email_post_to_subs: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p><strong>Preliminary: one Raspberry Pi 3, one Stable Linux Server</strong></p>
<ol>
<li>
<p>Setup <a href="https://help.ubuntu.com/lts/serverguide/openvpn.html">OpenVPN</a> between Pi and Server (NAT for Pi through the Internet)</p>
</li>
<li>
<p>Enable Pi as router (ip_forward), and then let PS4 use Pi as gateway</p>
</li>
<li>
<p>NAT PS4 on Pi or Set route information for Server. (Because the package don't know, how back to PS4</p>
</li>
</ol>
