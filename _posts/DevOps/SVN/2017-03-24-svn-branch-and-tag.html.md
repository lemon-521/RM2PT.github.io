---
layout: post
title: SVN branch and Tag
date: 2017-03-24 12:08:38.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, SVN]
tags:
- svn
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>svn copy ^/trunk/J-BHI\(arch\) ^/tags/J-BHI(arch)v1 -m "architecure paper draft v1"</p>
<p>svn update</p>
<p>if encounter :</p>
<pre>Committing transaction...

svn: E160013: File not found: transaction '141-45', path '/tags/backup'</pre>
<p>add --parents into the copy command</p>
