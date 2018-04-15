---
layout: post
title: Best Java EE IDE
date: 2017-12-22 19:27:47.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, IDE]
tags:
- javaee
- netbeans
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>Candidates:</p>
<ol>
<li>Eclipse Java EE</li>
<li>IntelliJ IDEA</li>
<li>NetBeans</li>
</ol>
<ul>
<li>Eclipse</li>
</ul>
<p>Add Server (glassfish / weblogic ) to the server, then you can create new Java EE web applications (without Maven).</p>
<p>Structures:</p>
<p>webfiles: WebContents</p>
<p>JPA persistence.xml : src/META-INF/persistence.xml (have plugin to support)</p>
<ul>
<li>IntelliJ IDEA</li>
</ul>
<ol>
<li>Add Server to IDE in File &gt; Setting &gt; Build, Execution, Development &gt; Application Server</li>
<li>Add Modules in File &gt; Project Structure &gt; Module : add web, Java EE application, JPA, EJB</li>
<li>Configure every Module appropriated</li>
<li>Create deployment artifact, you must include all your needed in the deployment</li>
<li>Create RUN / DEBUG configuration with deployment artifact inside.</li>
</ol>
<p>Structures:</p>
<p>webfiles: web</p>
<p>JPA persistence.xml : src/java/META-INF/persistence.xml (have plugin to support)</p>
<ul>
<li>NetBeans (Maven Natived)</li>
</ul>
<p>Add server, then create project in Maven &gt; Web Application / Java EE application</p>
<p>Structures: (Same as Maven)</p>
<blockquote><p>Each application module has the following structure:</p>
<ul>
<li>pom.xml: Maven build file</li>
<li>src/main/java: Java source files for the module</li>
<li>src/main/resources: configuration files for the module, with the exception of web applications</li>
<li>src/main/webapp: web pages, style sheets, tag files, and images (web applications only)</li>
<li>src/main/webapp/WEB-INF: configuration files for web applications (web applications only)</li>
</ul>
<p>When an example has multiple application modules packaged into an EAR file, its submodule directories use the following naming conventions:</p>
<ul>
<li>example-name-app-client: application clients</li>
<li>example-name-ejb: enterprise bean JAR files</li>
<li>example-name-war: web applications</li>
<li>example-name-ear: enterprise applications</li>
<li>example-name-common: library JAR containing components, classes, and files used by other modules</li>
</ul>
</blockquote>
<p>&nbsp;</p>
<p>Comparison:</p>
<p>NetBeans well supports Maven and RESTFul Web Service, clean file explorer</p>
<p>Eclipse well supports on Eclipse Foundation Project for software enginerring</p>
<p>IntelliJ IDEA supports on Java framework for Spring, Java EE, Android.</p>
<p>&nbsp;</p>
<p>Summary:</p>
<p>NetBeans is the best IDE of Java EE</p>
