---
layout: post
title: Xtend Collection Operations
date: 2017-12-15 16:47:21.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Xtext]
tags:
- java
- xtend
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>resource.allContents.toIterable.filter(typeof(UC)) return an iterator, but list</p>
<p>iterator need reset after iteratorion.</p>
<p>Solution: add .toList</p>
<p>resource.allContents.toIterable.filter(typeof(UC)).toList</p>
