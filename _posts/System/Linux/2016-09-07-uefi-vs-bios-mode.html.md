---
layout: post
title: UEFI vs BIOS mode
date: 2016-09-07 01:41:15.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- grub
- ubuntu
- uefi
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_job_id: '26550056793'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>UEFI could be compatible with BIOS mode</p>
<p>UEFI - GPT  (100MB fat32 partition, support +2TB) - parted</p>
<p>BIOS - MBR (1M at beginning of hard disk) -  fdisk</p>
<p>OSes need in same boot mode.</p>
<p>check UEFI or not</p>
<p>windows: disk manager whether have EFI partition</p>
<p>linux: [ -d /sys/firmware/efi ] &amp;&amp; echo "Installed in UEFI mode" || echo "Installed in Legacy mode"]  or /boot/efi mount or not</p>
<p>&nbsp;</p>
<p>ubuntu change between UEFI and BIOS mode</p>
<p>boot-repair</p>
<blockquote><p>If Ubuntu is installed on a GPT disk (you can check it via the 'sudo parted -l' command), use Gparted to create a BIOS-Boot partition (1MB, unformatted filesystem, bios_grub flag) at the start of its disk.</p>
<p>ESP can be created via a recent version of GParted (the Gparted version included in the 12.04 disk is OK), and must have the following attributes:</p>
<p>Mount point: /boot/efi (remark: no need to set this mount point when using the manual partitioning, the Ubuntu installer will detect it automatically)</p>
<p>Size: minimum 100Mib. 200MiB recommended.</p>
<p>Type: FAT32</p>
<p>Other: needs a "boot" flag.</p></blockquote>
<p>&nbsp;</p>
<p>Ubuntu supports UEFI boot by kernel or GRUB2 by UUID</p>
<p>If windows and ubuntu both</p>
<blockquote><p>Find where the windows bootloader resides by mounting the efi partition, and searching for bootmgfw.efi.<br />
then, find the uuid of the drive:</p>
<p>grub-probe --target=fs_uuid /boot/efi/efi/Microsoft/Boot/bootmgfw.efi<br />
add this to /etc/grub.d/40_custom:</p>
<p>menuentry "Windows x86_64 UEFI-GPT" {<br />
search --fs-uuid --no-floppy --set=root UUID<br />
chainloader (${root})/efi/Microsoft/Boot/bootmgfw.efi<br />
}<br />
and finally run update-grub.</p></blockquote>
<p>&nbsp;</p>
