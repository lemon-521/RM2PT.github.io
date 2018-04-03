---
layout: post
title: Left-Right 180 3D VR to Top-Bottom 360 VR for youtube
date: 2017-03-08 23:06:51.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Others, VR]
tags:
- '360'
- vr
- youtube
meta:
  _edit_last: '1'
  _wpcom_is_markdown: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<pre><code>ffmpeg -i source.mp4 -vf "stereo3d=sbsl:abl,pad=2*iw:ih:(ow-iw)/2:(oh-ih)/2,setdar=1:1,setsar=1" -c:a copy target.mp4
</code></pre>
