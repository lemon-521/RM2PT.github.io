---
layout: post
title: TensorFlow with GPU
date: 2016-09-07 23:54:00.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DeepLearning, TensorFlow]
tags: []
meta:
  _wpcom_is_markdown: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
  _publicize_job_id: '26583574231'
  _edit_last: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<pre><code class="lang-bash no-auto-prettify">apt-get install python-pip python-dev
</code></pre>
<pre><code class="lang-bash no-auto-prettify">export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/mac/gpu/tensorflow-0.10.0-py2-none-any.whl
</code></pre>
<pre><code>pip install --upgrade $TF_BINARY_URL</code></pre>
<pre><code class="lang-bash no-auto-prettify">export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda


</code></pre>
<pre><code class="lang-bash no-auto-prettify">Testing
$ python
...
>&gt;&gt; import tensorflow as tf
>&gt;&gt; hello = tf.constant('Hello, TensorFlow!')
>&gt;&gt; sess = tf.Session()
>&gt;&gt; print(sess.run(hello))
Hello, TensorFlow!
>&gt;&gt; a = tf.constant(10)
>&gt;&gt; b = tf.constant(32)
>&gt;&gt; print(sess.run(a + b))
42
>&gt;&gt;

</code></pre>
<pre><code class="lang-bash no-auto-prettify">/usr/local/lib/python2.7/dist-packages/tensorflow
</code>python models/image/mnist/convolutional.py</pre>
<pre><code class="lang-bash no-auto-prettify">tar xvzf cudnn-7.5-linux-x64-v4.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*</code></pre>
