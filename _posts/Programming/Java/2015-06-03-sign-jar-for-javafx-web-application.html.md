---
layout: post
title: Sign Jar for Javafx web application
date: 2015-06-03 02:11:42.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Java]
tags:
- java
- javafx
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_job_id: '11267766542'
  _edit_last: '1'
  _jetpack_dont_email_post_to_subs: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<blockquote>For web deployment, applications must be signed when there are @FXML annotations in the controller class. The FXMLLoader class uses reflection to set annotated fields. It calls the setAccessible() method on controller fields that are protected or private so it can inject the value from the FXML markup. The setAccessible() method is a privileged operation, and that privilege is not enabled by default for web applications.</p></blockquote>
<blockquote><p>JKS is the most common if you stay within the Java world. PKCS#12 isn't Java-specific, it's particularly convenient to use certificates (with private keys) backed up from a browser or coming from OpenSSL-based tools (keytool wasn't able to convert a keystore and import its private keys before Java 6, so you had to use other tools).<br />
There are a few other keystore types, perhaps less frequently used (depending on the context), those include:</p>
<ul>
<li>PKCS11, for PKCS#11 libraries, typically for accessing hardware cryptographic tokens, but the Sun provider implementation also supports NSS stores (from Mozilla) through this.</li>
<li>BKS, using the BouncyCastle provider (commonly used for Android).</li>
<li>Windows-MY/Windows-ROOT, if you want to access the Windows certificate store directly.</li>
<li>KeychainStore, if you want to use the OSX keychain directly.</li>
</ul>
</blockquote>
<pre><code>openssl genrsa -out server.key 2048
openssl req -new -out server.csr -key server.key
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
openssl pkcs12 -export -in cert.crt -inkey private.key -certfile cert.crt -name "tomcat" -out keystore.p12
keytool -importkeystore -srckeystore keystore.p12 -srcstoretype pkcs12 -destkeystore keystore.jks -deststoretype JKS
jarsigner jar-file alias
jarsigner -verify jar-file
</code></pre>
<p>or use Ant build.fxbuild signing tab<br />
alias for your name keypassword keystore keystore password storetype</p>
