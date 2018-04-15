---
layout: post
title: Equinox on eclipse and standalone
date: 2014-05-01 04:45:59.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Java]
tags:
- equinox
- osgi
meta:
  _publicize_pending: '1'
  _wpcom_is_markdown: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p><em>Introduction</em></p>
<p>build plug-in project, one more bundle activator and modify Mainfest.mf make application package(jar) to be bundle(component), component use service to connect each other, if you will declarative service explicitly, you can use OSGI-INF/xxx.xml define it. then service register / match are managed by declarative service</p>
<p><em>How to do it</em></p>
<p>1.stand-alone server / hosted in application</p>
<p>2.development in eclipse</p>
<p>2.1.  create plug-in project</p>
<p>2.2.  right click on mainfest.mf to run</p>
<blockquote><p>a. -clean on program argument / clear the configuration area before launching in setting.</p>
<p>b. configuration bundle when run equinox, mini bundles:<br />
org.eclipse.osgi<br />
.osgi.console<br />
org.apache.felix.gogo.command / runtime / shell</p>
<p>c. for repo org.apache.felix.bundlerepository (felix) and org.eclipse.equinox.p2.repository.(tool) (equinox)</p>
<p>d. basic<br />
help<br />
install uninstall update start stop<br />
lb/ss - list<br />
service - list service</p></blockquote>
<p>3.stand-alone</p>
<p>for felix : java -jar bin/felix.jar</p>
<p>for equinox :<br />
a. create config.ini in configuration</p>
<p>[code lang=text]<br />
osgi.bundles=file:org.apache.felix.gogo.runtime_0.10.0.v201209301036.jar@start,<br />
file:org.apache.felix.gogo.shell_0.10.0.v201212101605.jar@start,<br />
file:org.eclipse.equinox.console_1.0.100.v20130429-0953.jar@start,<br />
file:org.apache.felix.gogo.command_0.10.0.v201209301215.jar@start<br />
eclipse.ignoreApp=true<br />
[/code]</p>
<p>b. write .bat for run</p>
<p>[code lang=text]<br />
java -jar &quot;org.eclipse.osgi_3.9.1.v20140110-1610.jar&quot; -consoleLog -console -clean<br />
[/code]</p>
