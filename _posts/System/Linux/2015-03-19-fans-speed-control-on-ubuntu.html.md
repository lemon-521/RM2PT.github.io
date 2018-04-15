---
layout: post
title: Fans speed control on ubuntu
date: 2015-03-19 21:48:25.000000000 +08:00
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
<p>Install<br />
apt-get install lm-sensors fancontrol pwmconfig</p>
<p>Detect<br />
sensors-detect</p>
<p>Driver<br />
lsmod | grep xxxdriver<br />
modprobe xxxdriver<br />
add /etc/modules for boot start</p>
<p>Use<br />
sensors</p>
<p>Manual Control<br />
echo "1" &gt; /sys/devices/platform/it87.2576/pwm1_enable<br />
cat /sys/devices/platform/it87.2576/fan1_input (see fan`s rpm)<br />
echo "50" &gt;  /sys/class/hwmon/hwmon0/device/pwm1 (control it)</p>
<p>Automatic Control<br />
pwmconfig for /etc/fancontrol</p>
<blockquote><p>INTERVAL :: This variable defines at which interval in seconds the main loop of fancontrol will be executed<br />
FCTEMPS :: Maps PWM outputs to temperature sensors so fancontrol knows which temperature sensors should be used for calculation of new values for the corresponding PWM outputs.<br />
FCFANS :: FCFANS records the association between a PWM and a fan. Then fancontrol can check the fan speed and restart it if it stops unexpectedly.<br />
MINTEMP :: The temperature below which the fan gets switched off completely.<br />
MAXTEMP :: The temperature over which the fan gets switched to full speed.<br />
MINSTART :: Sets the minimum speed at which the fan begins spinning. You should use a safe value to be sure it works, even when the fan gets old.<br />
MINSTOP :: The minimum speed at which the fan still spins. Use a safe value here, too.</p></blockquote>
<p>run controller<br />
fancontrol start</p>
