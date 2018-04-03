---
layout: post
title: 'Docker - WARNING: No memory limit support'
date: 2018-01-07 12:12:18.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, Docker]
tags: []
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<ol>
<li>vim /etc/default/grub<br />
<code>GRUB_CMDLINE_LINUX="swapaccount=1"</code></li>
<li>update grub<br />
<code>$ sudo update-grub</code></li>
<li>reboot<br />
<code>$ sudo reboot</code></li>
<li>check<br />
<blockquote><p>$ sudo docker info</p></blockquote>
</li>
</ol>
<p>problems disapper</p>
<blockquote><p>WARNING: No memory limit support<br />
WARNING: No swap limit support</p></blockquote>
