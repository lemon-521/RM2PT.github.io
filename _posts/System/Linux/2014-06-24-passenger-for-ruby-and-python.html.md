---
layout: post
title: passenger for Ruby and Python
date: 2014-06-24 01:37:32.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  geo_public: '0'
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: ''
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>install passenger</p>
<blockquote><p>
sudo gem install passenger<br />
sudo passenger-install-apache2-module – for configuration</p></blockquote>
<p>edit apache load module</p>
<blockquote><p>
LoadModule passenger_module /usr/local/lib/ruby/gems/2.1.0/gems/passenger-4.0.37/buildout/apache2/mod_passenger.so<br />
PassengerRoot /usr/local/lib/ruby/gems/2.1.0/gems/passenger-4.0.37<br />
PassengerDefaultRuby /usr/local/bin/ruby</p></blockquote>
<p>add virtual host</p>
<blockquote><p>
&lt;VirtualHost *:8081&gt;<br />
DocumentRoot /var/www/ruby/redmine/public<br />
ServerName ror.mydreamy.net<br />
Errorlog /var/log/apache2/redmine_error.log<br />
Customlog /var/log/apache2/redmine_access.log common<br />
&lt;directory /var/www/ruby/redmine/public&gt;<br />
AllowOverride all<br />
Options -Indexes -MultiViews<br />
&lt;/directory&gt;<br />
&lt;/VirtualHost&gt;</p></blockquote>
