---
layout: post
title: Samba on Pi for xbox, mac, windows
date: 2014-10-03 05:07:53.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, ARM]
tags:
- pi
- samba
- xbox
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  geo_public: '0'
  _edit_last: '1'
  _yoast_wpseo_focuskw_text_input: samba,pi
  _yoast_wpseo_focuskw: samba,pi
  _yoast_wpseo_linkdex: '36'
  _yoast_wpseo_content_score: '90'
  _yoast_wpseo_primary_category: ''
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>Pi</h2>
<h3>Samba Info</h3>
<ul>
<li>SMBD<br />
** TCP 139: Samba on NetBios over TCP/IP (Xbox connects only support this type)<br />
** TCP 445: Samba on TCP/IP    (disable netbios = yes  / smb ports = 445)</li>
<li>NMBD<br />
** UDP 137,138 for discovery lookup</li>
</ul>
<h3>Install</h3>
<p>Disable xinted samba first, Then</p>
<p>[code lang=bash]<br />
apt-get install samba samba-common samba-common-bin<br />
[/code]</p>
<h3>Config</h3>
<p>In /etc/samba/smb.conf</p>
<p>[code lang=text]<br />
[Global]<br />
netbios name = pi #Make NetBIOS mode work</p>
<p>[YouDIYNAME]<br />
path = /x/x<br />
read only = no<br />
browsable = yes<br />
[/code]</p>
<p>Create password for system user</p>
<p>[code lang=bash]<br />
smbpasswd -a xx<br />
[/code]</p>
<h3>Start and Test</h3>
<p>[code lang=bash]<br />
update-rd.d samba defaults<br />
/etc/init.d/samba start (smbd and nmbd are started)<br />
smbclient -L hostname -U username%password<br />
[/code]</p>
<h2>Xbox</h2>
<p>Config Connectx in system, then find it in file manager</p>
<h2>Mac</h2>
<p>In Finder, go -&gt; connect to server</p>
<p>[code lang=text]<br />
smb://hostname/YOURDIYNAME<br />
[/code]</p>
<h2>Windows</h2>
<p>Map to local driver using \hostname\YOURDIYNAME</p>
