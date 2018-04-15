---
layout: post
title: enable upnp on openwrt
date: 2014-03-12 16:50:01.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags:
- openwrit
- upnp
meta:
  _publicize_pending: '1'
  geo_public: '0'
  _wpcom_is_markdown: '1'
  _oembed_e4e09b912aa0521564767040feebfaf6: "{{unknown}}"
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>Why</p>
<ol>
<li>NAT just map one internel ip to one public port</li>
<li>
<p>upnp could let software open dymanic port for mapping.  most BT needs it.</p>
</li>
</ol>
<p>How</p>
<ol>
<li>opkg update</li>
</ol>
<li>
<p>opkg instsall miniupnpd and ipset</p>
</li>
<li>
<p>/etc/init.d/miniupnpd enable &amp; start</p>
</li>
<p>http://wiki.openwrt.org/doc/howto/upnp</p>
