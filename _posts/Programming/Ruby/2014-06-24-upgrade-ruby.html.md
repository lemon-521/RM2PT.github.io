---
layout: post
title: Upgrade Ruby
date: 2014-06-24 02:57:42.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Ruby]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  geo_public: '0'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>Normal</h2>
<p>rvm get head<br />
rvm reload<br />
rvm get stable</p>
<h2>  Broken RVM</h2>
<p>You have broken version of RVM. Ubuntu does something to RVM that produces lots of errors, the only safe way of fixing for now is to:</p>
<pre class="lang-rb prettyprint prettyprinted"><code><span class="pln">sudo apt</span><span class="pun">-</span><span class="pln">get </span><span class="pun">--</span><span class="pln">purge remove ruby</span><span class="pun">-</span><span class="pln">rvm
sudo rm </span><span class="pun">-</span><span class="pln">rf </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="pln">share</span><span class="pun">/</span><span class="pln">ruby</span><span class="pun">-</span><span class="pln">rvm </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">rvmrc </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">profile</span><span class="pun">.</span><span class="pln">d</span><span class="pun">/</span><span class="pln">rvm</span><span class="pun">.</span><span class="pln">sh</span></code></pre>
<p>open new terminal and validate environment is clean from old RVM settings (should be no output):</p>
<pre class="lang-rb prettyprint prettyprinted"><code><span class="pln">env </span><span class="pun">|</span><span class="pln"> grep rvm</span></code></pre>
<p>if there was output, try to open new terminal, if it does not help then restart your computer.</p>
<p><a href="https://rvm.io/rvm/install/">install RVM</a>:</p>
<pre class="lang-rb prettyprint prettyprinted"><code><span class="pln">\curl </span><span class="pun">-</span><span class="pln">L https</span><span class="pun">://</span><span class="pln">get</span><span class="pun">.</span><span class="pln">rvm</span><span class="pun">.</span><span class="pln">io </span><span class="pun">|</span><span class="pln">
  bash </span><span class="pun">-</span><span class="pln">s stable </span><span class="pun">--</span><span class="pln">ruby </span><span class="pun">--</span><span class="pln">autolibs</span><span class="pun">=</span><span class="pln">enable </span><span class="pun">--</span><span class="pln">auto</span><span class="pun">-</span><span class="pln">dotfiles</span></code></pre>
