---
layout: post
title: Switch Display for HDMI and TFT
date: 2018-01-20 11:55:59.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- LED
- raspberry pi
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: '163'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>/etc/X11/xorg.conf.d/50-fbtft.conf</p>
<pre lang="text"><code># FBTFT xorg config file
#
# startx -- -layout TFT
# startx -- -layout HDMI
#
# When not specifying the layout, the first is used: TFT
#

Section "ServerLayout"
	Identifier "TFT"
	Screen 0 "ScreenTFT"
EndSection

Section "ServerLayout"
	Identifier "HDMI"
	Screen 0 "ScreenHDMI"
EndSection

Section "Screen"
	Identifier "ScreenHDMI"
	Monitor "MonitorHDMI"
	Device "DeviceHDMI"
Endsection

Section "Screen"
	Identifier "ScreenTFT"
	Monitor "MonitorTFT"
	Device "DeviceTFT"
Endsection

Section "Monitor"
	Identifier "MonitorHDMI"
Endsection

Section "Monitor"
	Identifier "MonitorTFT"
Endsection

Section "Device"
	Identifier "DeviceHDMI"
	Driver "fbturbo"
	Option "fbdev" "/dev/fb0"
	Option "SwapbuffersWait" "true"
EndSection

Section "Device"
	Identifier "DeviceTFT"
        Driver "fbturbo"
	Option "fbdev" "/dev/fb1"
        Option "SwapbuffersWait" "true"
EndSection</code></pre>
