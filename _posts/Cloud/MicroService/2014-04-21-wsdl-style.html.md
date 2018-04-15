---
layout: post
title: WSDL style
date: 2014-04-21 19:35:28.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, MicroService]
tags: []
meta:
  _edit_last: '1'
  _wpcom_is_markdown: '1'
  _wpas_done_all: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<ol>
<li>RPC/encoded</li>
<li>RPC/literal</li>
<li>Document/encoded</li>
<li>Document/literal</li>
<li>Document/literal Wrapped</li>
</ol>
<p>I test on Java, For me, I just care the WSDL file.</p>
<p>The mainly difference between RPC and Document is that  weather there has the schema for define the new type or not.</p>
