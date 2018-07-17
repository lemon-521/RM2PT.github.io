---
layout: post
title: Install Amber14 and AmberTools
date: 2017-12-06 12:44:52.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Others, Pharmaceutics]
tags:
- amber
meta:
  _edit_last: '1'
  _oembed_aac71f3b3d63bf81b2b082c6ef5906f6: "{{unknown}}"
  _yoast_wpseo_content_score: '30'
  _yoast_wpseo_primary_category: '12'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<ol>
<li>cd /home/myname<br />
tar xvfj AmberTools14.tar.bz2</li>
</ol>
<p># “amber14” directory)<br />
tar xvfj Amber14.tar.bz2 # (only if you have licensed Amber 14!)</p>
<p>2. export AMBERHOME=/home/myname/amber14</p>
<p>3. #ubuntu</p>
<p>sudo apt-get install csh flex gfortran g++ xorg-dev \<br />
zlib1g-dev libbz2-dev patch python-tk python-matplotlib</p>
<p>others</p>
<p>http://ambermd.org/ubuntu.html</p>
<p>4. configure (<span style="color: #ff0000;">vim config.h for right python version</span>)</p>
<p>1）single cpu（pmemd）</p>
<p>./configure gnu</p>
<p>2）paranell cpu（pmemd.MPI）</p>
<p>./configure -mpi gnu <span style="color: #ff0000;">(require <span class="s1">PATH=</span><span class="s2">/usr/lib64/openmpi/bin</span>)</span></p>
<p>3）gpu（pmemd.cuda）</p>
<p>./configure -cuda gnu</p>
<p>4）cpu and gpu（pmemd.cuda.MPI）</p>
<p>./configure -cuda -mpi gnu</p>
<p>5. source /home/myname/amber14/amber.sh</p>
<p>export LD_LIBRARY_PATH=/usr/local/cuda/lib:/usr/local/cuda/lib64:/home/exx/amber14/lib</p>
<p>export PATH=/usr/local/cuda-6.5/bin:/home/exx/amber14/bin:/usr/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin</p>
<p>test -f /home/exx/amber14/amber.sh &amp;&amp; source /home/exx/amber14/amber.sh</p>
<p>6. make install</p>
<p>7. make test (export DO_PARALLEL="mpirun -np 8")</p>
<p>8. Amber12_GPU_Benchmark_Suite.tar.gz</p>
<p>paraller CPU:</p>
<p>mpirun -np 12 pmemd.MPI  -O -i mdin -o cpuout -p prmtop -c inpcrd</p>
<p>GPU:</p>
<p>pmemd.cuda  -O -i mdin -o gpuout -p prmtop -c inpcrd</p>
