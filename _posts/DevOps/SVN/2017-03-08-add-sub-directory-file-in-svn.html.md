---
layout: post
title: Add sub-directory file in SVN
date: 2017-03-08 16:02:40.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, SVN]
tags: []
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p class="p1"><span class="s1">svn: E150000: Can't find parent directory's node while trying to add '/Users/yylonly/Dropbox/Apps/Texpad/svnpapers/J-BHI(arch)/bare_jrnl.tex'</span></p>
<p class="p1"><span class="s1">svn: E155010: The node '/Users/yylonly/Dropbox/Apps/Texpad/svnpapers/J-BHI(arch)' was not found.</span></p>
<p class="p1">Solution:</p>
<pre><code>svn add --parents directory/file</code></pre>
