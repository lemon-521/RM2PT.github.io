---
layout: post
title: Git Reset (local Repo)
date: 2016-10-21 03:24:19.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, Git]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _publicize_job_id: '28056759150'
  mytory_md_path: ''
  mytory_md_text: ''
  mytory_md_mode: url
  _mytory_markdown_etag: ''
  _edit_last: '1'
  _sd_is_markdown: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<pre> reset commit: git reset --soft HEAD~1
 reset add the index: git reset HEAD filename
 reset file change: git reset --hard HEAD

</pre>
<pre><code>reset to some version: git reset --hard xxxxx (see from git log)
undo reset: git reflog, then git reset --hard xxx (see from git reflog)
</code></pre>
<p>auto stage file for commit (deleted and modified files)</p>
<pre>git add -u 
git comit -a</pre>
