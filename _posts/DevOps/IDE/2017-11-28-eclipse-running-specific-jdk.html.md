---
layout: post
title: Eclipse Running on specific JDK
date: 2017-11-28 15:54:47.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, IDE]
tags:
- eclipse
- jdk
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: '25'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>vim eclipse.ini</p>
<p>add following before -vmargs</p>
<blockquote><p>-vm</p>
<p>$JAVA_HOME/bin</p></blockquote>
<p>&nbsp;</p>
