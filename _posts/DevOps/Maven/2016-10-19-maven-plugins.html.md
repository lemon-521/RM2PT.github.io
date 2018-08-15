---
layout: post
title: Maven Plugins
date: 2016-10-19 05:00:43.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, Maven]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _publicize_job_id: '27985671116'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---

### maven-compiler plugin 
```
mvn compile
```
### exec-maven plugin (Alternatives for java -cp classpath package.mainclass)
```
mvn exec:java 
``` 

### maven-shade-plugin (good alternatives for eclipse export) big jar
```
mvn package 
```

### tycho plugin 
for eclipse plugin update-site and RCP

### javafx-maven-plugin
javafx auto-package
```
mvn jfx:jar
mvn jfx:native //assemble as installer
```
