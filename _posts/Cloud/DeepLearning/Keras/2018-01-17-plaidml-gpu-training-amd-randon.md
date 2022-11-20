---
layout: post
title: PlaidML GPU Training On AMD Randon
date: 2018-01-17 11:47:18.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DeepLearning, Keras]
tags:
- gpu
- keras
- plaidml
meta:
  _edit_last: '1'
  _oembed_c3e5067624964dbceca046b2f4f06835: "{{unknown}}"
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: '158'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>Pre-requested: tensorflow, keras</p>
<ul>
<li>Install clinfo (to check OpenCL and GPU) - https://github.com/simleb/clinfo</li>
<li>pip3 install plaidml-keras</li>
<li>plaidml-setup (pick the GPU you wanna use)</li>
<li>test</li>
</ul>
<blockquote><p>git clone https://github.com/plaidml/plaidbench.git<br />
cd plaidbench<br />
sudo pip install -r requirements.txt<br />
python plaidbench.py mobilenet</p></blockquote>
<ul>
<li>use plaidml backend on keras project</li>
</ul>
<blockquote><p>Simply insert this code BEFORE you import keras:</p>
<p># Install the plaidml backend<br />
import plaidml.keras<br />
plaidml.keras.install_backend()</p></blockquote>
<p>Note that: PlaidML currently not support all Keras layers</p>
