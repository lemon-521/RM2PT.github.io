---
layout: post
title: svn diff using FileMerge (Mac)
date: 2017-03-16 15:45:32.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, SVN]
tags:
- diff
- filemerge
- svn
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>svn-diffwrap.sh</p>
<blockquote><p>#!/bin/sh<br />
#<br />
# Put this somewhere like ~/bin<br />
#<br />
# Configure your favorite diff program here.<br />
#DIFF="/Users/username/bin/mvim -d"<br />
#DIFF="/usr/bin/vimdiff"<br />
DIFF="/usr/bin/opendiff"</p>
<p># Subversion provides the paths we need as the sixth and seventh<br />
# parameters.<br />
LEFT=${6}<br />
RIGHT=${7}</p>
<p># Call the diff command (change the following line to make sense for<br />
# your merge program).<br />
$DIFF $LEFT $RIGHT</p>
<p># Return an errorcode of 0 if no differences were detected, 1 if some were.<br />
# Any other errorcode will be treated as fatal.</p></blockquote>
<p>svn diff --diff-cmd /location/svn-diffwrap.sh</p>
<p>or</p>
<p>edit .subversion/config</p>
<blockquote><p>diff-cmd = /localtion/svn-diffwrap.sh</p></blockquote>
<p>&nbsp;</p>
