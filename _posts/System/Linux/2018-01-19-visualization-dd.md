---
layout: post
title: Visualization DD
date: 2018-01-19 20:33:29.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- dd
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: '13'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>Install <code>pv</code> and put it between input / output only <code>dd</code> commands.</p>
<p>&nbsp;</p>
<blockquote><p><code>pv</code> - Pipe Viewer - is a terminal-based tool for monitoring the progress of data through a pipeline. It can be inserted into any normal pipeline between two processes to give a visual indication of how quickly data is passing through, how long it has taken, how near to completion it is, and an estimate of how long it will be until completion.</p></blockquote>
<p><strong>Installation</strong></p>
<pre><code>sudo apt-get install pv
</code></pre>
<p><strong>Example</strong></p>
<pre><code>dd if=/dev/urandom | pv | dd of=/dev/null
</code></pre>
<p><strong>Output</strong></p>
<pre><code>1,74MB 0:00:09 [ 198kB/s] [      &lt;=&gt;                               ]
</code></pre>
<p>For Pi backup and restore</p>
<p>dd if=/dev/xxx | pv | dd of=/targetpath/pi.img</p>
<p>dd if=/pi.img | pv | dd of=/dev/xxx</p>
