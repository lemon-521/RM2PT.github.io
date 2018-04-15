---
layout: post
title: Brew in mac
date: 2014-07-04 17:55:14.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Unix]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  geo_public: '0'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>Install</h2>
<p>Dont install it by Root</p>
<p>[code lang=bash]<br />
ruby -e &quot;$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)&quot;<br />
[/code]</p>
<h2>Config</h2>
<p>[code lang=bash]<br />
chgrp -R admin /usr/local<br />
chmod -R g+w /usr/local<br />
chgrp -R admin /Library/Caches/Homebrew<br />
chmod -R g+w /Library/Caches/Homebrew<br />
[/code]</p>
<h2>Check and Update</h2>
<p>[code lang=bash]<br />
brew doctor<br />
brew update<br />
[/code]</p>
