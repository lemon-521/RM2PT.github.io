---
layout: post
title: Anaconda with Conda (includes Python)
date: 2017-09-14 08:36:21.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Keras/TensorFlow
- Machine Learning
- Programming
- Python
- System
- Unix/Linux
tags:
- conda
- keras
- python
- tensorflow
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: ''
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>Conda is really good package manager. It is installed into only one directory without need root permission, and support virtual environment like docker</p>
<p>download Anaconda, extract to the directory,  then set PATH</p>
<p>Environment</p>
<blockquote><p>conda info --envs  //list all environment</p>
<p>conda create --name xxx //create xxx environment</p>
<p>source activate xxx //activate xxx environment</p>
<p>conda remove --name xxx --all //delete xxx environment</p></blockquote>
<p>Package</p>
<blockquote><p>condo search xxx  //search package</p>
<p>conda install xxx=x.x.x=xxxx //install package</p>
<p>conda remove xxx //delete package</p></blockquote>
