---
layout: post
title: TensorFlow source code build and share library for c++
date: 2017-06-22 07:32:21.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DeepLearning, TensorFlow]
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>1.Git clone and checkout the desired version</p>
<ul>
<li>git clone https://github.com/tensorflow/tensorflow</li>
</ul>
<p>2. Prerequestity</p>
<p>2.1  Python Packages</p>
<ul>
<li>apt-get install python3-numpy python3-dev python3-pip python3-wheel</li>
</ul>
<blockquote><p><code>numpy</code>, which is a numerical processing package that TensorFlow requires.</p>
<p><code>dev</code>, which enables adding extensions to Python.</p>
<p><code>pip</code>, which enables you to install and manage certain Python packages.</p>
<p><code>wheel</code>, which enables you to manage Python compressed packages in the wheel (.whl) format.</p></blockquote>
<p>2. 2 Install Bazel</p>
<blockquote><p>bazel-0.5.0-installer.sh: default version with embedded JDK<br />
bazel-0.5.0-without-jdk-installer.sh: version without embedded JDK<br />
bazel-0.5.0-jdk7-installer.sh: version compatible with JDK 7, will not be available in later releases</p></blockquote>
<p>2.3 NVIDIA CUDA CuDNN libcupti-dev</p>
<ul>
<li>apt-get install libcupti-dev</li>
</ul>
<p>3. Configure</p>
<blockquote><p>$ cd tensorflow # cd to the top-level directory created<br />
$ ./configure<br />
Please specify the location of python. [Default is /usr/bin/python]: /usr/bin/python2.7<br />
Please specify optimization flags to use during compilation when bazel option "--config=opt" is specified [Default is -march=native]:<br />
Do you wish to use jemalloc as the malloc implementation? [Y/n]<br />
jemalloc enabled<br />
Do you wish to build TensorFlow with Google Cloud Platform support? [y/N]<br />
No Google Cloud Platform support will be enabled for TensorFlow<br />
Do you wish to build TensorFlow with Hadoop File System support? [y/N]<br />
No Hadoop File System support will be enabled for TensorFlow<br />
Do you wish to build TensorFlow with the XLA just-in-time compiler (experimental)? [y/N]<br />
No XLA JIT support will be enabled for TensorFlow<br />
Found possible Python library paths:<br />
/usr/local/lib/python2.7/dist-packages<br />
/usr/lib/python2.7/dist-packages<br />
Please input the desired Python library path to use. Default is [/usr/local/lib/python2.7/dist-packages]<br />
Using python library path: /usr/local/lib/python2.7/dist-packages<br />
Do you wish to build TensorFlow with OpenCL support? [y/N] N<br />
No OpenCL support will be enabled for TensorFlow<br />
Do you wish to build TensorFlow with CUDA support? [y/N] Y<br />
CUDA support will be enabled for TensorFlow<br />
Please specify which gcc should be used by nvcc as the host compiler. [Default is /usr/bin/gcc]:<br />
Please specify the Cuda SDK version you want to use, e.g. 7.0. [Leave empty to use system default]: 8.0<br />
Please specify the location where CUDA 8.0 toolkit is installed. Refer to README.md for more details. [Default is /usr/local/cuda]:<br />
Please specify the cuDNN version you want to use. [Leave empty to use system default]: 5<br />
Please specify the location where cuDNN 5 library is installed. Refer to README.md for more details. [Default is /usr/local/cuda]:<br />
Please specify a list of comma-separated Cuda compute capabilities you want to build with.<br />
You can find the compute capability of your device at: https://developer.nvidia.com/cuda-gpus.<br />
Please note that each additional compute capability significantly increases your build time and binary size.<br />
[Default is: "3.5,5.2"]: 3.0<br />
Setting up Cuda include<br />
Setting up Cuda lib<br />
Setting up Cuda bin<br />
Setting up Cuda nvvm<br />
Setting up CUPTI include<br />
Setting up CUPTI lib64<br />
Configuration finished</p></blockquote>
<p>4. Build By Bazel</p>
<p>4.1 build wh. for pip install</p>
<ul>
<li>bazel --output_user_root=/win1/Ubuntu_App/tensorflowout build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package</li>
<li>bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg</li>
<li>pip3 install /tmp/tensorflow_pkg/tensorflow-1.2.0-py2-none-any.whl</li>
</ul>
<p>4.3 build new c++ file with bazel</p>
<ul>
<li>bazel --output_user_root=/win1/Ubuntu_App/tensorflowout build --config opt //tensorflow/core/user_ops:facc.so</li>
</ul>
<p>4.2 build .so for tensorfolw c++ API</p>
<ul>
<li> bazel --output_user_root=/win1/Ubuntu_App/tensorflowout build //tensorflow:libtensorflow_all.so</li>
</ul>
<p>append following in tensorflow/BUILD</p>
<blockquote><p>+cc_binary(</p>
<p>+    name = "libtensorflow_all.so",</p>
<p>+    linkshared = 1,</p>
<p>+    linkopts = ["-Wl,--version-script=tensorflow/tf_version_script.lds"], # if</p>
<p>+    deps = [</p>
<p>+        "//tensorflow/cc:cc_ops",</p>
<p>+        "//tensorflow/cc:client_session",</p>
<p>+        "//tensorflow/core:framework_internal",</p>
<p>+        "//tensorflow/core:tensorflow",</p>
<p>+    ],</p>
<p>+)</p></blockquote>
