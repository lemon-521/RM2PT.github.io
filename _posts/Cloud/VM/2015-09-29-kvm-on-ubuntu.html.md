---
layout: post
title: KVM on Ubuntu
date: 2015-09-29 23:31:52.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, VM]
tags: []
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_job_id: '15289986993'
  _edit_last: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h1>Test CPU suppport</h1>
<pre><code>egrep -c '(vmx|svm)' /proc/cpuinfo
cat /sys/hypervisor/properties/capabilities
kvm-ok
</code></pre>
<h1>Install KVM</h1>
<pre><code class="bash">apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
apt-get install virt-manager (if system has X11)
</code></pre>
<h1>install system</h1>
<pre><code>virt-install --connect qemu:///system -n ubuntu14.04kvm -r 512 -f /kvmimages/ -s 12 -c /dev/cdrom --vnc --noautoconsole --os-type linux --os-variant ubuntutrusty --accelerate --network bridge=br0
virt-install --connect qemu:///system -n win10 -r 4048 -f /kvmimages/win10.img --kvm -c --vnc --noautoconsole --os-type windows --accelerate --network bridge=br0
virt-viewer -c qemu+ssh://root@10.119.180.33/system?socket=/var/run/libvirt/libvirt-sock
</code></pre>
