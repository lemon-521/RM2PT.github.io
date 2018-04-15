---
layout: post
title: Raspberry Pi 3 install Android TV
date: 2017-11-30 19:03:50.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags:
- androidtv
- pi
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '60'
  _yoast_wpseo_primary_category: '163'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>Option 1:</p>
<p>win32 image writer with a .img file from <a href="http://geektillithertz.com/wordpress/">here</a></p>
<p>Option 2:</p>
<p>download aosp boot.img and system.img from <a href="https://forum.xda-developers.com/raspberry-pi/development/rom-tab-pi-aosp-android-tv-raspberry-pi-t3593506">URL</a></p>
<p>dd to partition dd if= of= bs=2M</p>
<p>/dev/sda1 512M boot (label 2) FAT32</p>
<p>/dev/sda2 1024M system ext4</p>
<p>/dev/sda3 512M cache ext4</p>
<p>/dev/sda3 remain size data ext4</p>
<p>Andorid will boot, without anything.</p>
<p>Install google apps by gapps.sh</p>
<p>other apk with <a href="http://from http://www.mediafire.com/file/618z4hkr4gqoyg1/FTV+v0.68.zip">FTV URL</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
