---
layout: post
title: TFTP for openwrt and rasperberry pi
date: 2014-08-17 16:04:24.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags: []
meta:
  _publicize_pending: '1'
  _wpcom_is_markdown: '1'
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
<p>OpenWRT uses Dnsmasq as its default DNS forwarder and DHCP server. It is also has a built-in TFTP server.</p>
<h3>Openwrt  (tftp forward)</h3>
<p>[code lang=bash]<br />
vim /etc/config/dhcp<br />
  enable_tftp=1<br />
  dhcp_boot=pxelinux.0,,x.x.x.x<br />
/etc/init.d/dnsmasq restart<br />
[/code]</p>
<h3>Rasperberry</h3>
<p>[code lang=bash]<br />
apt-get install tftpd-hpa<br />
vim /etc/default/tftpd-hpa<br />
service tftpd-hpa start<br />
[/code]</p>
