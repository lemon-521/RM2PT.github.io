---
layout: post
title: Maven local execute, remote deploy and execution
date: 2018-01-08 20:54:31.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, Maven]
tags:
- maven
- remote deploy
meta:
  _edit_last: '1'
  _oembed_299d1570af72fdec3c53f3dc14c5ec09: "{{unknown}}"
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>pom.xml</p>
<blockquote><p>&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"<br />
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"&gt;</p>
<p>&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;<br />
&lt;groupId&gt;com.mycompany.app&lt;/groupId&gt;<br />
&lt;artifactId&gt;my-app&lt;/artifactId&gt;<br />
&lt;packaging&gt;jar&lt;/packaging&gt;<br />
&lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;<br />
&lt;name&gt;my-app&lt;/name&gt;<br />
&lt;url&gt;http://maven.apache.org&lt;/url&gt;</p>
<p>&lt;properties&gt;</p>
<p>&lt;mClass&gt;App&lt;/mClass&gt;</p>
<p>&lt;/properties&gt;</p>
<p>&lt;build&gt;<br />
&lt;extensions&gt;<br />
&lt;extension&gt;<br />
&lt;groupId&gt;org.apache.maven.wagon&lt;/groupId&gt;<br />
&lt;artifactId&gt;wagon-ssh&lt;/artifactId&gt;<br />
&lt;version&gt;2.8&lt;/version&gt;<br />
&lt;/extension&gt;<br />
&lt;/extensions&gt;<br />
&lt;plugins&gt;<br />
&lt;plugin&gt;<br />
&lt;groupId&gt;org.codehaus.mojo&lt;/groupId&gt;<br />
&lt;artifactId&gt;exec-maven-plugin&lt;/artifactId&gt;<br />
&lt;version&gt;1.6.0&lt;/version&gt;<br />
&lt;configuration&gt;<br />
&lt;mainClass&gt;${project.groupId}.${mClass}&lt;/mainClass&gt;<br />
&lt;/configuration&gt;<br />
&lt;/plugin&gt;<br />
&lt;plugin&gt;<br />
&lt;!-- Build an executable JAR --&gt;<br />
&lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;<br />
&lt;artifactId&gt;maven-jar-plugin&lt;/artifactId&gt;<br />
&lt;version&gt;3.0.2&lt;/version&gt;<br />
&lt;configuration&gt;<br />
&lt;archive&gt;<br />
&lt;manifest&gt;<br />
&lt;mainClass&gt;${project.groupId}.${mClass}&lt;/mainClass&gt;<br />
&lt;/manifest&gt;<br />
&lt;/archive&gt;<br />
&lt;/configuration&gt;<br />
&lt;/plugin&gt;<br />
&lt;plugin&gt;<br />
&lt;groupId&gt;org.codehaus.mojo&lt;/groupId&gt;<br />
&lt;artifactId&gt;wagon-maven-plugin&lt;/artifactId&gt;<br />
&lt;version&gt;1.0&lt;/version&gt;<br />
&lt;configuration&gt;<br />
&lt;fromFile&gt;target/${project.artifactId}-${project.version}.jar&lt;/fromFile&gt;<br />
&lt;url&gt;scp://root:880301@192.168.0.2/root&lt;/url&gt;<br />
&lt;commands&gt;<br />
&lt;command&gt;pkill -f ${project.artifactId}-${project.version}.jar&lt;/command&gt;<br />
&lt;command&gt;java -jar /root/${project.artifactId}-${project.version}.jar&lt;/command&gt;<br />
&lt;/commands&gt;<br />
&lt;displayCommandOutputs&gt;true&lt;/displayCommandOutputs&gt;<br />
&lt;/configuration&gt;<br />
&lt;/plugin&gt;<br />
&lt;/plugins&gt;<br />
&lt;/build&gt;</p>
<p>&lt;/project&gt;</p></blockquote>
<p>Local execution:</p>
<blockquote><p>mvn exec:java</p>
<p>mvn exec:java -Dexec.mainClass="package.className"</p></blockquote>
<p>Remote deploy and execution</p>
<blockquote><p>mvn clean package wagon:upload-single wagon:sshexec</p></blockquote>
<p>reference: http://xxgblog.com/2015/10/23/wagon-maven-plugin/</p>
