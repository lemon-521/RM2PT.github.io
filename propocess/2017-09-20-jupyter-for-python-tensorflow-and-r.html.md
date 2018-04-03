---
layout: post
title: Jupyter for Python, TensorFlow, and R
date: 2017-09-20 09:21:04.000000000 +08:00
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
- R
tags:
- conda
- jupyter
- r
meta:
  _edit_last: '1'
  _oembed_87f0b003ad4749a6a10b441d80473bf1: "{{unknown}}"
  _oembed_1c261ff8fa68cd9234d4dc3dc1223d42: "{{unknown}}"
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: ''
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>&nbsp;</p>
<p>Jupyter, Python, and some scientific packages are already installed in the Anaconda</p>
<p>TensorFlow:</p>
<blockquote><p>conda install tensorflow</p>
<p>conda install tensorflow-gpu</p></blockquote>
<p>R</p>
<blockquote><p>conda install r-esstentials</p></blockquote>
<p>Jupyter</p>
<blockquote><p>jupyter notebok</p></blockquote>
<p>Jupyter Configuration</p>
<ul>
<li>jupyter notebook --generate-config</li>
<li>jupyter notebook password</li>
<li>jupyter_notebook_config.py</li>
</ul>
<blockquote><p>c.NotebookApp.ip = '*'<br />
c.NotebookApp.port = 9999</p>
<p>c.NotebookApp.open_browser = False</p></blockquote>
<p>Jupyter-scala</p>
<blockquote><p>git clone https://github.com/jupyter-scala/jupyter-scala.git</p>
<p>cd jupyter-scala</p>
<p>jupyter-scala</p>
<p>jupyter kernelspec list</p>
<p>import $ivy.`org.jupyter-scala:scio:0.4.2`</p></blockquote>
<h6 class="post-title">28 Jupyter Notebook tips, tricks and shortcuts</h6>
<p>https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/</p>
