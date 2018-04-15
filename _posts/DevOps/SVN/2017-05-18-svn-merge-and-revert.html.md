---
layout: post
title: SVN merge and revert
date: 2017-05-18 17:19:04.000000000 +08:00
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
<p>svn diff -r 8979:11390<br />
svn diff -r PREV:HEAD</p>
<p>svn revert -R .  (back to lasest repo)<br />
svn revert -R path/filename</p>
<p>svn merge -r HEAD:xxx . (back to some version)</p>
