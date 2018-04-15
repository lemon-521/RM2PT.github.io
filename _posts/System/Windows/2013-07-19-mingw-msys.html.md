---
layout: post
title: MinGW & MSYS
date: 2013-07-19 05:01:28.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Windows]
tags:
- mingw
- msys
meta:
  geo_public: '0'
  _publicize_job_id: '15776080999'
  _wpcom_is_markdown: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p><span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">MinGW</span>  :   mini <span class="GINGER_SOFATWARE_correct">gcc</span> chain</p>
<ul>
<li><span class="GINGER_SOFATWARE_correct">binutils</span></li>
<li><span class="GINGER_SOFATWARE_correct">mingw</span>-runtime (dev and <span class="GINGER_SOFATWARE_correct">dll</span>)</li>
<li>w32api</li>
<li>Required runtime libraries for GCC</li>
<li><span class="GINGER_SOFATWARE_correct">gcc</span>-core</li>
<li><span class="GINGER_SOFATWARE_correct">gcc</span>-g++ for c++</li>
</ul>
<p>MSYS:  shell</p>
<p>Install by CLI</p>
<ol>
<li><span class="GINGER_SOFATWARE_correct">download</span>  <a href="http://sourceforge.net/projects/mingw/files/Automated%20MinGW%20Installer/mingw-get/"><span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">mingw</span>-get</a> , then extract to c:\MinGW (if you use mingw-get-setup.exe, path c:\mingw\bin)</li>
<li>
<p><span class="GINGER_SOFATWARE_correct">add</span> C:\MinGW to PATH</p>
</li>
<li>
<p> Install MinGW<code><br />
</code></p>
</li>
</ol>
<p><strong>       <span class="GINGER_SOFATWARE_correct">mingw</span>-get install <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">gcc</span> g++ mingw32-make</strong></p>
<ol>
<li> Install MSYS</li>
</ol>
<p><span class="GINGER_SOFATWARE_correct">mingw</span>-get install <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">msys</span>-base  /  <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">mingw</span>-developer-toolkit (flex/bison included)</p>
<ol>
<li> Run Postinstall.bat in <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">msys</span> folder</li>
</ol>
<li>
<p>ADD  C:\MinGW\MSYS\1.0\bin to PATH</p>
</li>
<li>
<p> Add more environment ()</p>
</li>
<p>C_INCLUDE_PATH =</p>
<p style="padding-left:30px;">C:\MinGW\include;C:\MinGW\msys\1.0\include;</p>
<p style="padding-left:30px;">C:\MinGW\lib\gcc\mingw32\x.x.x\include;</p>
<p>       CPLUS_INCLUDE_PAT H =</p>
<p style="padding-left:30px;">C:\MinGW\include;C:\MinGW\msys\1.0\include;</p>
<p style="padding-left:30px;">C:\MinGW\lib\gcc\mingw32\x.x.x\include\c++;</p>
<p style="padding-left:30px;">C:\MinGW\lib\gcc\mingw32\x.x.x\include\c++\backward;</p>
<p style="padding-left:30px;">C:\MinGW\lib\gcc\mingw32\x.x.x\include\c++\mingw32\bits;</p>
<ol>
<li> <span class="GINGER_SOFATWARE_correct">compile</span> source without using native API</li>
</ol>
<p><span class="GINGER_SOFATWARE_correct">configre</span> --prefix=   make   make install  make clean</p>
<ol>
<li> Some Package :  <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">msys</span>-vim <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">mingw</span>-**</li>
</ol>
<p><span class="GINGER_SOFATWARE_correct">mingw</span>-get <span class="GINGER_SOFATWARE_correct">list</span> &gt;&gt; <span class="GINGER_SOFATWARE_correct">aa</span> .<span class="GINGER_SOFATWARE_correct">txt</span></p>
<ol>
<li>/ /<span class="GINGER_SOFATWARE_correct">usr</span> mount as <span class="GINGER_SOFATWARE_correct">msys</span></li>
</ol>
<p>/<span class="GINGER_SOFATWARE_correct">mingw</span> mount as <span class="GINGER_SOFATWARE_correct">mingw</span></p>
<p>c: d:  mount a /c /d</p>
