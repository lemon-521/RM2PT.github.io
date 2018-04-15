---
layout: post
title: MS-DOS7, windows 3.1 and SimTower
date: 2016-07-12 23:49:19.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Windows]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _publicize_job_id: '24716570616'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>package MS-DOS as msdos.iso, windows3.1 img as floppy mount to virtual machine sepetally.</p>
<ol>
<li>
<p>create virtual machine for windows 3.1 in virtualbox (64mb memory, 1gb disk)</p>
</li>
<li>
<p>install msdos</p>
</li>
<li>
<p>install windows 3.1 by running '''setup''' mount img 1 to 6</p>
</li>
<li>
<p>configurate windows (graphics or  setup command under c:\windows )</p>
</li>
</ol>
<ol>
<li>install sound card driver same in virtual box soundblast (220, slot 5)</li>
<li>graphics card driver (Super VGA 1024x768 256 colors) need patch</li>
</ol>
<blockquote><p>How to:<br />
- make a temporary directory e.g. ’tmpsvga’<br />
- run svga.exe in it<br />
- run vgapatch p (or svgaptch -p)<br />
- run windows setup from the DOS prompt (this may require a 'cd c:\windows' command first)<br />
- select ’Other (Requires disk...)’ and point to temporary directory<br />
- select Super VGA 1024*768 256 Small (small fonts is nicer but large fonts work equally well)<br />
- finish and start windows.</p></blockquote>
<ol>
<li>install simtower and enjoy</li>
</ol>
