---
layout: post
title: Router Auto Unblock Youku
date: 2015-03-19 07:04:37.000000000 +08:00
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
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _wpas_skip_facebook: '1'
  _wpas_skip_google_plus: '1'
  _wpas_skip_twitter: '1'
  _wpas_skip_linkedin: '1'
  _wpas_skip_tumblr: '1'
  _wpas_skip_path: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>Resolve on DNS side or Proxy side:</p>
<p>DNS side : DNS(Like local hosts file) resolve block URL to the proxy server (which listen on 80)</p>
<p>Proxy side: forward all http to proxy server (may not 80 port), forward or not based on URL rules of proxy server</p>
<p>Local Cache Proxy (Privoxy)</p>
<ol>
<li>Dnsmasq</li>
</ol>
<p>edit /etc/dnsmasq.conf with addn-hosts=/etc/privoxy/basehosts</p>
<p>x.x.x.x  username</p>
<ol>
<li> Privoxy (can make more complex rules )</li>
</ol>
