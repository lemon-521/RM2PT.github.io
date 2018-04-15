---
layout: post
title: 'ubuntu freeze: Adding 16764924k swap on  Priority:-1 extents:1 across:FS'
date: 2016-10-14 19:00:09.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _publicize_job_id: '27834068369'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>t is doing this because Ubuntu is trying to switch to a high resolution video mode for the console and your hardware isn't cooperating.</p>
<p><strong>Fixing this while at the machine</strong></p>
<p>When Grub2 shows up:</p>
<ul>
<li>Highlight the menu item for Ubuntu and press 'e'</li>
<li>Go to the line where it loads the kernel and press 'End' to go to the end of the line</li>
<li>Add 'nomodeset'</li>
<li>Press F10 or Ctrl-X to boot it</li>
</ul>
<p>With any luck it will boot into the login screen. This won't save that option but at least now you can edit the file for Grub2 and update it to save that option if it works. I <a href="http://blog.jamesrhall.com/2014/04/ubuntu-server-1404-fun.html" rel="nofollow">blogged</a> about this recently.</p>
<p><strong>Fixing this for good</strong></p>
<ul>
<li>Log in (ssh will probably do, if you know the machine's IP)</li>
<li>Update the grub config file <code>nano /etc/default/grub</code></li>
<li>Find the line that starts with <code>GRUB_CMDLINE_LINUX_DEFAULT</code></li>
<li>Edit the line to include <code>nomodeset</code>, in my case, the line looked like this afterwards: <code>GRUB_CMDLINE_LINUX_DEFAULT="nomodeset"</code></li>
<li>Save/exit nano</li>
<li>Run <code>update-grub</code></li>
<li>Reboot</li>
</ul>
