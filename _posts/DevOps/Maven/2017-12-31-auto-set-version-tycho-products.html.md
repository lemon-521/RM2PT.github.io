---
layout: post
title: auto set version in tycho products
date: 2017-12-31 15:59:30.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, Maven]
tags:
- maven
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<blockquote>&lt;pluginManagement&gt;</p>
<p>&lt;plugins&gt;</p>
<p>&lt;plugin&gt;</p>
<p>&lt;groupId&gt;org.eclipse.tycho&lt;/groupId&gt;</p>
<p>&lt;artifactId&gt;tycho-versions-plugin&lt;/artifactId&gt;</p>
<p>&lt;version&gt;${tycho-version}&lt;/version&gt;</p>
<p>&lt;/plugin&gt;</p>
<p>&lt;/pluginManagement&gt;</p>
<p>&lt;/plugins&gt;</p></blockquote>
<p>Then,</p>
<blockquote><p>mvn tycho-versions:set-version -DnewVersion=1.0.0-SNAPSHOT</p></blockquote>
