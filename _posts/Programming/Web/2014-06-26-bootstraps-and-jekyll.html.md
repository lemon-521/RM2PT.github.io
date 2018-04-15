---
layout: post
title: Bootstraps and jekyll
date: 2014-06-26 02:29:20.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Web]
tags: []
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_pending: '1'
  _edit_last: '1'
  _yoast_wpseo_content_score: '60'
  _yoast_wpseo_primary_category: ''
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>Install node</h2>
<blockquote><p>
wget nodejsxxx.tar.gz (use right version to rapberry pi is *arm.tar.gz)<br />
tar -zxvf xxx<br />
add bin to path</p></blockquote>
<h2>Reinstall Grunt (node.js running tools)</h2>
<blockquote><p>npm uninstall grunt<br />
npm install grunt@0.4.2</p></blockquote>
<h2>Jekyll (Markdown blog based Ruby)</h2>
<blockquote><p>
gem install jekyll<br />
jekyll new my-awesome-site<br />
cd my-awesome-site<br />
jekyll serve #Now browse to http://localhost:4000</p></blockquote>
<h2>Bower (Web Project Manager)</h2>
<blockquote><p>
npm install -g bower</p></blockquote>
<h2>Boostraps</h2>
<blockquote><p>
bower install bootstrap<br />
cd bootstrap<br />
npm install (install all packages)<br />
npm install -g less<br />
npm install uglify-js<br />
npm install lodash<br />
npm install glob<br />
npm install minimatch<br />
npm install connect<br />
npm install connect-livereload<br />
npm install open colors request vow sauce-tunnel jscs/lib/checker superagent gaze grunt-lib-contrib which grunt-lib-contrib jshint lodash-node/modern/objects<br />
grunt (compile, test and run all things)</p></blockquote>
