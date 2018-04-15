---
layout: post
title: Caffe with GPU support on Ubuntu 14.04
date: 2015-01-22 17:18:10.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- caffe
- cuda
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _wpas_skip_facebook: '1'
  _wpas_skip_google_plus: '1'
  _wpas_skip_twitter: '1'
  _wpas_skip_linkedin: '1'
  _wpas_skip_tumblr: '1'
  _wpas_skip_path: '1'
  _edit_last: '1'
  _wpas_done_all: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>Kernel and GCC</h2>
<p>3.8.x, please do not use 3.13.x 3.16.x 3.19.x<br />
gcc 4.6.x, 4.8.x will have problem with kernel compiling</p>
<ul>
<li>Directly, Install on http://kernel.ubuntu.com/~kernel-ppa/mainline/</li>
</ul>
<pre><code>dpkg -i linux-headers-*.deb linux-headers-*.all.deb linux-image-*.deb
</code></pre>
<ul>
<li>Apt based</li>
</ul>
<pre><code>apt-cache search xxx
apt-get install xx
apt-get install -f
dpkg --force-depends -r / -i
</code></pre>
<h2>Grub 2.x</h2>
<ul>
<li>configuration files:</li>
</ul>
<p>/etc/default/grub and /etc/default/grub.d/</p>
<ul>
<li>templates files:</li>
</ul>
<p>/etc/grub.d<br />
50_linux<br />
* generated menu:</p>
<p>/boot/grub/grub.cfg</p>
<h2>X windows with lightdm (Login manager)</h2>
<pre><code>apt-get install xorg lightdm / gdm
</code></pre>
<h2>Xfce4 or gnome</h2>
<pre><code>apt-get install xfce4 cfce-goodies or gnome-shell
</code></pre>
<h2>Nvidia driver and Cuda</h2>
<pre><code>/etc/init.d/lightdm stop
./cuda6.5xxx.sh (need stop login manager)
export PATH=$PATH:/usr/local/cuda-6.5/bin
export LD_LIBRARY_PATH=/usr/local/cuda-6.5/lib64:$LD_LIBRARY_PATH
vim /etc/ld.so.conf
/usr/local/cuda-6.5/ib64
</code></pre>
<h2>Caffe</h2>
<h3>Caffe Clone</h3>
<pre><code>git clone https://github.com/BVLC/caffe.git
</code></pre>
<h3>Prepare (Do not use Anaconda Python)</h3>
<pre><code>apt-get install libatlas-base-dev
cd $Caffe-ROOT/python
for req in $(cat requirements.txt); do sudo pip install $req; done
export PYTHONPATH=$Caffe-ROOT/python into /etc/profile
apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev
apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler
</code></pre>
<h3>Compile (CMake)</h3>
<pre><code>cd $Caffe-ROOT
vim Makefile.config (Modified)
mkdir build
cd build
cmake ..
make all
make runtest
</code></pre>
