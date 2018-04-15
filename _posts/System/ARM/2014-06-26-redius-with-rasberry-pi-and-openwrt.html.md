---
layout: post
title: Redius with Rasberry Pi and OpenWrt
date: 2014-06-26 00:05:49.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags: []
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_pending: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>FreeRedius</h2>
<p>[code lang=bash]<br />
sudo apt-get update<br />
sudo apt-get install freeradius<br />
vim /etc/freeradius/users (uncomment user or add more)<br />
service freeradius restart<br />
radtest username passwd 127.0.0.1 0 xxxx<br />
vim /etc/freeradius/client.conf<br />
[/code]</p>
<p>[code lang=text]<br />
client 192.168.0.0/24 {<br />
secret = testing123-1<br />
shortname = private-network-1<br />
}<br />
[/code]</p>
<p>[code lang=text]<br />
service freeradius restart<br />
[/code]</p>
<h2>Openwrt</h2>
<p>[code lang=bash]<br />
vim /etc/config/wireless<br />
[/code]</p>
<p>[code lang=text]<br />
config &#039;wifi-iface&#039;<br />
        option &#039;device&#039; &#039;radio0&#039;<br />
        option &#039;ssid&#039; &#039;mydreamy&#039;<br />
        option &#039;mode&#039; &#039;ap&#039;<br />
        option &#039;network&#039; &#039;lan&#039;<br />
        option &#039;encryption&#039; &#039;wpa2+ccmp&#039;<br />
        option &#039;auth_server&#039; &#039;192.168.0.120&#039;<br />
        option &#039;auth_secret&#039; &#039;mydreamymacau&#039;<br />
        option &#039;acct_server&#039; &#039;192.168.0.120&#039;<br />
        option &#039;acct_secret&#039; &#039;mydreamymacau&#039;<br />
[/code]</p>
