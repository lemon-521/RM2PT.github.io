---
layout: post
title: Dnsmasq (DNS forward and DHCP) for static IP and Name
date: 2014-10-03 05:18:42.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags:
- dnsmasq
- openwrt
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  geo_public: '0'
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
<p>Dnsmasq for Small LAN (&lt;50)</p>
<h3>Config Domain</h3>
<p>[code lang=text]<br />
config &#039;dnsmasq&#039;<br />
option &#039;local &#039;/umacdorm&#039; # Read IP-NAME(*.umacdorm) in /etc/hosts<br />
option &#039;domain &#039;umacdorm&#039; # Give DHCP client prefix umacdorm<br />
option &#039;readethers &#039;1&#039; # Static IP-MAC in /etc/ethers<br />
[/code]</p>
<h3>Static IP</h3>
<ul>
<li>/etc/ehters</li>
</ul>
<h3>NAME</h3>
<ul>
<li>/etc/hosts</li>
</ul>
<h3>ALL-IN-ONE</h3>
<ul>
<li>/etc/config/dhcp</li>
</ul>
<p>[code lang=text]<br />
config host<br />
option ip &#039;192.168.0.2&#039;<br />
option mac &#039;b8:27:eb:e5:e3:85&#039;<br />
option name &#039;pi&#039;</p>
<p>config host<br />
option ip &#039;192.168.0.3&#039;<br />
option mac &#039;7c:1e:52:d9:03:ed&#039;<br />
option name &#039;xbox&#039;<br />
[/code]</p>
<p>Restart<br />
```bash<br />
/etc/init.d/dnsmasq restart</p>
