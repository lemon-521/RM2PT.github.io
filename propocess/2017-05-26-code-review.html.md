---
layout: post
title: Code Review
date: 2017-05-26 15:47:36.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Programming
tags:
- git
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>git rm -r --cached net.mydreamy.requirementmodel.edit  //delete and keep file</p>
<p>after commit runing</p>
<p>arc diff // generate revision for code review</p>
<p>reviewer reviews revision in web (after accept or need change)</p>
<p>git push (don`t forget push)</p>
<h2 class="remarkup-header">Installing Arcanist</h2>
<p>First, install dependencies:</p>
<ul class="remarkup-list">
<li class="remarkup-list-item">Install PHP.</li>
<li class="remarkup-list-item">Install Git.</li>
</ul>
<p>Then install Arcanist itself:</p>
<div class="remarkup-code-block" data-code-lang="console" data-sigil="remarkup-code-block">
<pre class="remarkup-code"><span class="gp">$ mkdir somewhere/</span>
<span class="gp">$ cd somewhere/</span>
somewhere/ <span class="gp">$ git clone https://github.com/phacility/libphutil.git</span>
somewhere/ <span class="gp">$ git clone https://github.com/phacility/arcanist.git</span></pre>
</div>
<p>Add <tt class="remarkup-monospaced">arc</tt> to your path:</p>
<div class="remarkup-code-block" data-code-lang="console" data-sigil="remarkup-code-block">
<pre class="remarkup-code"><span class="gp">$ export PATH="$PATH:/somewhere/arcanist/bin/"</span></pre>
</div>
<p>This won't work for Windows, see <a class="atom-ref" href="https://secure.phabricator.com/diviner/find/?name=Arcanist_User_Guide%3A_Windows&amp;type=article&amp;jump=1">Arcanist User Guide: Windows</a> for instructions.</p>
<h2 class="remarkup-header">Configure Your Project</h2>
<p>For detailed instructions on project configuration, see <a class="atom-ref" href="https://secure.phabricator.com/diviner/find/?name=Arcanist_User_Guide%3A_Configuring_a_New_Project&amp;type=article&amp;jump=1">Arcanist User Guide: Configuring a New Project</a>.</p>
<p>Create a <tt class="remarkup-monospaced">.arcconfig</tt> file in your project's working copy:</p>
<div class="remarkup-code-block" data-code-lang="console" data-sigil="remarkup-code-block">
<pre class="remarkup-code"><span class="gp">$ cd yourproject/</span>
yourproject/ <span class="gp">$ $EDITOR .arcconfig</span>
yourproject/ <span class="gp">$ cat .arcconfig</span>
<span class="go">{</span>
<span class="go">  "phabricator.uri" : "https://phabricator.example.com/"</span>
<span class="go">}</span></pre>
</div>
<p>Set <tt class="remarkup-monospaced">phabricator.uri</tt> to the URI for your Phabricator install (where <tt class="remarkup-monospaced">arc</tt> should send changes to).</p>
<div class="remarkup-note"><span class="remarkup-note-word">NOTE:</span> You should <strong>commit this file</strong> to the repository.</div>
<h2 class="remarkup-header"><a name="install-arcanist-credent"></a>Install Arcanist Credentials</h2>
<p>Credentials allow you to authenticate. You must have an account on Phabricator before you can perform this step.</p>
<div class="remarkup-code-block" data-code-lang="console" data-sigil="remarkup-code-block">
<pre class="remarkup-code"><span class="gp">$ cd yourproject/</span>
yourproject/ <span class="gp">$ arc install-certificate</span>
<span class="go">...</span></pre>
</div>
