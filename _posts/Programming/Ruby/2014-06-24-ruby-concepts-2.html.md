---
layout: post
title: Ruby concepts
date: 2014-06-24 00:59:30.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Ruby]
tags:
- ruby
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  geo_public: '0'
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
<h3>RVM</h3>
<p>Ruby version management tools</p>
<blockquote><p>
curl -L https://get.rvm.io | bash -s stable<br />
rvm install &lt;version&gt;</p></blockquote>
<h3>RubyGems</h3>
<p>Ruby package management tools (manual like RPM)</p>
<blockquote><p>
gem install rails / bundler<br />
gem update --system<br />
gem update</p></blockquote>
<h3>Bundler (.Gemfile)</h3>
<p>package management tools of project by Gemfile file (like maven)</p>
<blockquote><p>gem install bundler<br />
bundle install # will install all the package need by this project</p></blockquote>
<h3>Rails</h3>
<p>Web framework for Ruby</p>
<blockquote><p>
rake db:migrate<br />
rake db:create<br />
other backup</p></blockquote>
<h3>Jekyll</h3>
<blockquote><p>gem install jekyll</p>
<p>jekyll new xxx</p>
<p>cd xxx</p>
<p>bundle install</p>
<p>bundle exec jekyll serve</p></blockquote>
