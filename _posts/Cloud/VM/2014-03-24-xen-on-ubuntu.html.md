---
layout: post
title: Xen on ubuntu
date: 2014-03-24 21:58:38.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, VM]
tags:
- debian
- ubuntu
- xen
meta:
  _publicize_pending: '1'
  _rest_api_published: '1'
  _rest_api_client_id: "-1"
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>PVM : Paravirtualized</p>
<p>HVM:  Fully. Need CPU support and Bios enabled.</p>
<p>Virtualized Tools:   LXC KVM XEN</p>
<p>Management Tools: XAPI(Xe) XL(XL) XEND(XM) Libvirt(virt-install, virsh, virt-clone)</p>
<p>1. Install xen kernel and enable it </p>
<ul>
<li> apt-get install xen-hypervisor-amd64</li>
<li> sed -i 's/GRUB_DEFAULT=.*\+/GRUB_DEFAULT="Xen 4.1-amd64"/' /etc/default/grub</li>
<li> mv /etc/grub.d/10_linux /etc/grub.d/50_linux</li>
<li> update-grub</li>
<li> sed -i 's/TOOLSTACK=.*\+/TOOLSTACK="xm"/' /etc/default/xen</li>
</ul>
<p>2.  Install Management Tool (libvirt and xend)</p>
<p>3. create LV partition or Image </p>
<p>   dd if=/dev/zeros of=test.img bs=1G count=8</p>
<p>4. Install system on image</p>
<p>4.1 libvirt way</p>
<p>     virt-install -n debian -r 1024 -f /xenimages/ubuntu-guest2.img -l URL --network network=default,model=virtio (-v hvm -p part)</p>
<p>     URL must be the repos online. or cdrom/iso under HVM model </p>
<p>     (http://mirror.anl.gov/pub/)</p>
<p> 4.2 Xend way (No need repos firstly)</p>
<p>    download: vmlinuz and initrd.gz </p>
<p>    create ubuntu.cfg</p>
<blockquote><p>name = "ubuntu12.04"</p>
<p>memory = 1024</p>
<p>disk = ['file:/xenimages/ubuntu-guest2.img,xvda,w']<br />vif = ['bridge=virbr0']<br />dhcp = "dhcp"</p>
<p>kernel = "/var/lib/xen/images/ubuntu-netboot/vmlinuz"<br />ramdisk = "/var/lib/xen/images/ubuntu-netboot/initrd.gz"<br />extra = "debian-installer/exit/always_halt=true -- console=hvc0"</p>
</blockquote>
<p>   more see :</p>
<p>    http://wiki.xen.org/wiki/Xen_Configuration_File_Options</p>
<p>    http://wiki.xen.org/wiki/Xen_Networking</p>
<p>5. manage by xm</p>
<p>   xm list</p>
<p>   xm shutdown </p>
<p>   xm create ubuntu.cfg -c</p>
<p>   xm delete</p>
<p> </p>
