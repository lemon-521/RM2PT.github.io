---
layout: post
title: Openwrt AP and Client Mode
date: 2015-04-23 00:42:31.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  geo_public: '0'
  _wpas_done_all: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>[code lang=text]<br />
config wifi-device &#039;ra0&#039;<br />
option type &#039;rt2860v2&#039;<br />
option name &#039;rt2860v2&#039;<br />
option mode &#039;9&#039;<br />
option txpower &#039;100&#039;<br />
option ht &#039;40&#039;<br />
option country &#039;US&#039;<br />
option disabled &#039;0&#039;<br />
option channel &#039;3&#039;  # same channel with AP server<br />
[/code]</p>
<p>== AP Mode ==</p>
<p>[code lang=text]<br />
config wifi-iface<br />
option device &#039;ra0&#039;<br />
option network &#039;lan&#039;<br />
option mode &#039;ap&#039;<br />
option ssid &#039;mydreamy-br&#039;<br />
option encryption &#039;psk2+aes&#039;<br />
option key &#039;&#039;<br />
[/code]</p>
<p>== Client Mode == /etc/config/dhcp - lan</p>
<p>[code lang=text]<br />
config wifi-iface<br />
option network &#039;wwan&#039;<br />
option ssid &#039;mydreamy&#039;<br />
option wds &#039;1&#039;<br />
option encryption &#039;psk2+aes&#039;<br />
option device &#039;ra0&#039;<br />
option mode &#039;sta&#039;<br />
option key &#039;&#039;<br />
[/code]</p>
<p>== Bridge Mode == /etc/config/dhcp - lan : option ignore 1</p>
<p>[code lang=text]<br />
config wifi-iface<br />
option network &#039;lan&#039;<br />
option ssid &#039;mydreamy&#039;<br />
option wds &#039;1&#039;<br />
option encryption &#039;psk2+aes&#039;<br />
option device &#039;ra0&#039;<br />
option mode &#039;sta&#039;<br />
option key &#039;&#039;<br />
[/code]</p>
