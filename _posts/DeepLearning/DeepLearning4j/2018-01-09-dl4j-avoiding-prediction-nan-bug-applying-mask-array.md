---
layout: post
title: 'DL4J: avoiding prediction NaN bug when applying mask array'
date: 2018-01-09 20:52:06.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DeepLearning, DeepLearning4j]
tags:
- DL4J
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<blockquote>Nd4j.getExecutioner().exec(new ReplaceNans(lables[j], -1));</p></blockquote>
