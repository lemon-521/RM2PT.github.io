---
layout: post
title: CentOS 6.7 yum repair
date: 2017-12-06 12:38:26.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Programming
- Python
- System
- Unix/Linux
tags:
- centos
- yum
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: '140'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>&nbsp;</p>
<ol>
<li>download 6.7 iso cd1 and cd2 to local, mount to /cd1 /cd2</li>
<li>6.7 yum only support python2.6</li>
<li>set PYTHONPATH=/usr/local/amber14/lib/python2.6/site-packages:/usr/lib64/python2.6/site-packages:/usr/lib/python2.6/site-packages</li>
<li>download yum source package</li>
<li>make make install</li>
<li>./pymain.py install yum</li>
<li>yum check</li>
<li>yum update</li>
</ol>
<p>&nbsp;</p>
