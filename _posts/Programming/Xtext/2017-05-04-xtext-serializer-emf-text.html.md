---
layout: post
title: Xtext Serializer (EMF -> Text)
date: 2017-05-04 16:35:08.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Xtext]
tags:
- Serializer
- xtext
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>In the generator:</p>
<p>Serializer s = Guice.createInjector(new REMODELRuntimeModule()).getInstance(Serializer);</p>
<p>options = SaveOptions.newBuilder.format.options</p>
<p>«c.def.serialize(options)»</p>
<p>&nbsp;</p>
