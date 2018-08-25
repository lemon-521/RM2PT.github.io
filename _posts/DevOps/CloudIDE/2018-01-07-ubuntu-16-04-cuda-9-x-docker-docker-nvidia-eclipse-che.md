---
layout: post
title: Ubuntu 16.04 + CUDA 9.x + Docker + Docker Nvidia + Eclipse Che
date: 2018-01-07 16:22:19.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, IDE]
tags:
- docker
- docker nvidia
- eclipse che
meta:
  _edit_last: '1'
  _oembed_d5f68e6a6284631c1d4236cf53a18c63: "{{unknown}}"
  _oembed_21d8da0dd938e63eca39391a3559519f: "{{unknown}}"
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<h1>Install Docker</h1>
<p>$ sudo apt-get remove docker docker-engine docker.io</p>
<div class="language-bash highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code><span class="nv">$ </span><span class="nb">sudo </span>apt-get update</code></pre>
</div>
</div>
<div class="language-bash highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code><span class="nv">$ </span><span class="nb">sudo </span>apt-get install <span class="se">\</span>
    apt-transport-https <span class="se">\</span>
    ca-certificates <span class="se">\</span>
    curl <span class="se">\</span>
    software-properties-common</code></pre>
</div>
</div>
<div class="language-bash highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code><span class="nv">$ </span>curl <span class="nt">-fsSL</span> https://download.docker.com/linux/ubuntu/gpg | <span class="nb">sudo </span>apt-key add -</code></pre>
</div>
</div>
<div class="tab-content">
<div id="x86_64_repo" class="tab-pane fade in active">
<div class="language-bash highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code><span class="nv">$ </span><span class="nb">sudo </span>add-apt-repository <span class="se">\</span>
   <span class="s2">"deb [arch=amd64] https://download.docker.com/linux/ubuntu </span><span class="se">\</span>
   <span class="k">$(</span>lsb_release <span class="nt">-cs</span><span class="k">)</span> <span class="se">\</span><span class="s2">
   stable"</span></code></pre>
</div>
</div>
</div>
</div>
<div class="language-bash highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code><span class="nv">$ </span><span class="nb">sudo </span>apt-get update</code></pre>
</div>
</div>
<div class="language-bash highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code><span class="nv">$ </span><span class="nb">sudo </span>apt-get install docker-ce</code></pre>
</div>
</div>
<div class="language-bash highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code><span class="nv">$ </span><span class="nb">sudo </span>docker run hello-world
</code></pre>
</div>
</div>
<h1><strong>Docker Nvidia</strong></h1>
<blockquote><p>https://github.com/NVIDIA/nvidia-docker</p></blockquote>
<h4><a id="user-content-xenial-x86_64" class="anchor" href="https://github.com/NVIDIA/nvidia-docker#xenial-x86_64" aria-hidden="true"></a>Xenial x86_64 - run the following bash script</h4>
<div class="highlight highlight-source-shell">
<pre><span class="pl-c"># If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers</span>
docker volume ls -q -f driver=nvidia-docker <span class="pl-k">|</span> xargs -r -I{} -n1 docker ps -q -a -f volume={} <span class="pl-k">|</span> xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker

<span class="pl-c"># Add the package repositories</span>
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey <span class="pl-k">|</span> \
  sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu16.04/amd64/nvidia-docker.list <span class="pl-k">|</span> \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

<span class="pl-c"># Install nvidia-docker2 and reload the Docker daemon configuration</span>
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

<span class="pl-c"># Test nvidia-smi with the latest official CUDA image</span>
docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
</pre>
</div>
<h1><strong>Eclipse Che</strong></h1>
<div class="language-shell highlighter-rouge">
<div class="highlight">
<pre class="highlight"><code>docker run <span class="nt">-it</span> <span class="nt">--rm</span> <span class="nt">-v</span> /var/run/docker.sock:/var/run/docker.sock <span class="nt">-v</span> &lt;path&gt;:/data eclipse/che start</code></pre>
</div>
</div>
<h1><strong>Cuda Docker Images for Che</strong></h1>
<p>https://hub.docker.com/r/nvidia/cuda/</p>
