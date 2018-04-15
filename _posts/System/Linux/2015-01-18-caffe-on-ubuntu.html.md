---
layout: post
title: Caffe with Python Wrapper on Ubuntu
date: 2015-01-18 20:52:55.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _publicize_pending: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _wpas_skip_facebook: '1'
  _wpas_skip_google_plus: '1'
  _wpas_skip_twitter: '1'
  _wpas_skip_linkedin: '1'
  _wpas_skip_tumblr: '1'
  _wpas_skip_path: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>-------1 ----</p>
<p>apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev</p>
<p>apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler</p>
<p>--------2 -----</p>
<p>Anaconda and set</p>
<p>export LD_LIBRARY_PATH=/root/anaconda/lib</p>
<p>rm -rf anaconda/lib/libm*</p>
<p>------3------</p>
<p>cp Makefile.config.example Makefile.config</p>
<p>CPU_ONLY := 1</p>
<p>USE_CUDNN := 1</p>
<p>PYTHON_INCLUDE for anaconda</p>
<p>------4--------</p>
<p>BLAS: apt-get install libatlas-base-dev</p>
<hr />
<p>git clone https://github.com/BVLC/caffe.git</p>
<p>cd caffe</p>
<p>make all -j 8</p>
<p>make pycaffe / make matcaffe</p>
<p>make test</p>
<p>make runtest</p>
