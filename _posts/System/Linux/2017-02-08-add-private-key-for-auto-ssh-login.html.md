---
layout: post
title: Add private key for auto ssh login
date: 2017-02-08 06:57:37.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags: []
meta:
  _edit_last: '1'
  _jetpack_dont_email_post_to_subs: '1'
  _wpcom_is_markdown: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>In that&nbsp;<strong>ssh/config</strong>&nbsp;file, add the following lines:</p>
<h2>Mac</h2>
<pre><code>Host *
UseKeychain yes
AddKeysToAgent yes
IdentityFile ~/.ssh/id_rsa&lt;/code&gt;
</code></pre>
<h2>Linux</h2>
<pre><code>Host mcloud
HostName mydreamy.net
IdentityFile /root/key/yylonly
User root
Port 65439
</code></pre>
