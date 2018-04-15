---
layout: post
title: Run Matlab with local JRE (Mac)
date: 2015-05-20 18:59:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Matlab]
tags:
- java
- mac
- matlab
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _wpas_done_all: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<ol>
<li>
<p>environment<br />
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)<br />
export MATLAB_JAVA=/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home/jre/</p>
</li>
<li>
<p>package to Java<br />
2.1 javabuilder.jar and MCR<br />
2.2 yourfunction.jar</p>
</li>
</ol>
