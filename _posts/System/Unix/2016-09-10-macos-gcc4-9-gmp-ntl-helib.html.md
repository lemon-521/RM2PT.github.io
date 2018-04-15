---
layout: post
title: 'MacOS: gcc4.9 + gmp + ntl + HElib'
date: 2016-09-10 00:39:35.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Unix]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _publicize_job_id: '26657122059'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
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
<ol>
<li>Install GCC 4.9
<ol>
<li>brew install homebrew/versions/gcc49</li>
</ol>
</li>
<li><a href="https://gmplib.org">GMP</a>
<ol>
<li>./configure --prefix=/usr/local/gmp CC=gcc-4.9</li>
<li>make</li>
<li>make check</li>
<li>sudo make install</li>
</ol>
</li>
<li><a href="http://www.shoup.net/ntl/">NTL</a>
<ol>
<li>cd src</li>
<li>./configure PREFIX=/usr/local/ntl NTL_GMP_LIP=on GMP_PREFIX=/usr/local/gmp CXX=g++-4.9</li>
<li>make</li>
<li>sudo make install</li>
</ol>
</li>
<li><a href="https://github.com/shaih/HElib">HElib</a>
<ul>
<li>vim Makefile (<span style="color: #ff0000;">libfhe.a</span>)</li>
</ul>
</li>
</ol>
<blockquote><p>CC = g++-4.9</p>
<p>CFLAGS=-g -O2 -std=c++11 -I/usr/local/ntl/include -I/usr/local/gmp/include</p>
<p>LDLIBS=-L/usr/local/lib -L/usr/local/gmp/lib -L/usr/local/ntl/lib -lm -lntl -lgmp</p></blockquote>
<ol>
<li style="list-style-type: none;">
<ul>
<li>make</li>
<li>make check</li>
</ul>
</li>
</ol>
<blockquote><p>g++-4.9 -g -O2 -std=c++11 -I/usr/local/ntl/include -c aaa.cpp</p>
<p>g++-4.9 -g -o aaa.out aaa.o -L/usr/local/ntl/lib -L/usr/local/gmp/lib -lntl -lgmp libfhe.a</p>
<p>g++-4.9 -g -O2 -std=c++11 -I/usr/local/ntl/include -I/usr/local/gmp/include  -o Test_General_x Test_General.cpp libfhe.a -L/usr/local/lib -L/usr/local/gmp/lib -L/usr/local/ntl/lib -lm -lntl -lgmp</p></blockquote>
<p>5. Eclipse CDT</p>
<p>project-&gt;property-&gt;c/c++ build-&gt;setting</p>
<p>gcc c++ compiler</p>
<blockquote><p>/usr/local/bin/g++-4.9</p>
<p>-std=c++11 -I/usr/local/include -I/usr/local/eigen/include -I/usr/local/ntl/include -I/usr/local/gmp/include -I/Applications/MATLAB_R2014b.app/extern/include -I/Users/yylonly/HElib/src -O0 -g3 -Wall -c -fmessage-length=0</p></blockquote>
<p>gcc c++ linker</p>
<blockquote><p>/usr/local/bin/g++-4.9</p>
<p>-L/usr/local/lib -L/usr/local/gmp/lib -L/Users/yylonly/HElib/src -L/Applications/MATLAB_R2014b.app/bin/maci64 -Wl,-rpath,/Applications/MATLAB_R2014b.app/bin/maci64</p></blockquote>
