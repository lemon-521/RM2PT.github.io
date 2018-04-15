---
layout: post
title: Time Capsule on ubuntu
date: 2014-06-12 19:02:08.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- mac
- time capsule
- time machine
- ubuntu
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  geo_public: '0'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<ul>
<li>Install</li>
</ul>
<p>[code lang=bash]<br />
apt-get install avahi-daemon<br />
apt-get install netatalk  (zeroconf advertise protocol)<br />
[/code]</p>
<ul>
<li>(Server Name)In /etc/netatalk/afpd.conf </li>
</ul>
<p>[code lang=text]<br />
  uncomment &quot;Macau Server&quot; -tcp -noddp -uamlist uams_dhx.so,uams_dhx2.so -nosavepassword<br />
[/code]</p>
<ul>
<li>(Folder Name)In  /etc/netatalk/AppleVolumes.default</li>
</ul>
<p>[code lang=text]<br />
  comment user mode, add /TimeMachineFolder &quot;Time Capsule&quot;  cnidscheme:dbd options:usedots,upriv,tm  allow:userToUseOnTimeMachine<br />
[/code]</p>
<ul>
<li>create user userToUseOnTimeMachine, and folder TimeMachineFolder by this user.</li>
<li>service netatalk restart</li>
</ul>
<p>In finder add afp://hostname first, then open time machine use it</p>
