---
layout: post
title: 'Docker - WARNING: No memory limit support'
date: 2018-01-07 12:12:18.000000000 +08:00
type: post
categories: [Cloud, Docker]
author: yylhome
---

## Problems

    > WARNING: No memory limit support  
    > WARNING: No swap limit support

## Solution

edit /etc/default/grub

    GRUB_CMDLINE_LINUX="swapaccount=1"

update grub  

    $ sudo update-grub

reboot  

    $ sudo reboot

check  

    $ sudo docker info
