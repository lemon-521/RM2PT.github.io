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

* `maven-jar-plugin`: This plugin provides the capability to build and sign JARs. But it just compiles the java files under src/main/java and src/main/resources/. It doesn't include the dependencies JAR files.

* `maven-assembly-plugin`: This plugin extracts all dependency JARs into raw classes and groups them together. It can also be used to build an executable JAR by specifying the main class. It works in project with less dependencies only; for large project with many dependencies, it will cause Java class names to conflict.

* `maven-shade-plugin`: It packages all dependencies into one uber-JAR. It can also be used to build an executable JAR by specifying the main class. This plugin is particularly useful as it merges content of specific files instead of overwriting them by relocating classes. This is needed when there are resource files that have the same name across the JARs and the plugin tries to package all the resource files together.
