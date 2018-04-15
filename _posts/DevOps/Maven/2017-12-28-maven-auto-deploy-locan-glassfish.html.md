---
layout: post
title: maven auto-deploy to locan glassfish
date: 2017-12-28 06:54:54.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, Maven]
tags:
- glassfish
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
<blockquote>&lt;plugin&gt;<br />
&lt;groupId&gt;org.glassfish.maven.plugin&lt;/groupId&gt;<br />
&lt;artifactId&gt;maven-glassfish-plugin&lt;/artifactId&gt;<br />
&lt;version&gt;2.1&lt;/version&gt;<br />
&lt;configuration&gt;<br />
&lt;glassfishDirectory&gt;C:\Users\Yilong\Desktop\payara41\glassfish&lt;/glassfishDirectory&gt;<br />
&lt;user&gt;admin&lt;/user&gt;<br />
&lt;passwordFile&gt;"C:\Users\Yilong\Desktop\payara41\glassfish\domains\payaradomain\config\domain-passwords"&lt;/passwordFile&gt;<br />
&lt;domain&gt;<br />
&lt;name&gt;payaradomain&lt;/name&gt;<br />
&lt;httpPort&gt;8080&lt;/httpPort&gt;<br />
&lt;adminPort&gt;4848&lt;/adminPort&gt;<br />
&lt;/domain&gt;<br />
&lt;components&gt;<br />
&lt;component&gt;<br />
&lt;name&gt;${project.artifactId}&lt;/name&gt;<br />
&lt;artifact&gt;target/${project.build.finalName}.war&lt;/artifact&gt;<br />
&lt;/component&gt;<br />
&lt;/components&gt;<br />
&lt;debug&gt;true&lt;/debug&gt;<br />
&lt;terse&gt;false&lt;/terse&gt;<br />
&lt;echo&gt;true&lt;/echo&gt;<br />
&lt;/configuration&gt;<br />
&lt;/plugin&gt;</p></blockquote>
