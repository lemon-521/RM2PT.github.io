---
layout: post
title: Test border firewall open some port or not
date: 2013-11-03 18:45:22.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- nc
- ports
meta:
  _publicize_pending: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>One server, one PC, tools NC</p>
<p>1. Listen on the server</p>
<p><span class="GINGER_SOFATWARE_correct">nc</span> -l 4444 (for <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">tcp</span>)</p>
<p><span class="GINGER_SOFATWARE_correct">nc</span> -l -u 4444 (for <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">udp</span>)</p>
<p>2. Connect from a PC</p>
<p>echo <span class="GINGER_SOFATWARE_spelling">aaa</span> | <span class="GINGER_SOFATWARE_spelling">nc</span> -u <span class="GINGER_SOFATWARE_spelling">xxxx</span> port</p>
<p>3. <span class="GINGER_SOFATWARE_correct">scan</span></p>
<p><span class="GINGER_SOFATWARE_correct">nc</span> -z -v hostname 4444 (for <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">tcp</span>)</p>
<p><span class="GINGER_SOFATWARE_correct">nc</span> -z -v -u hostname 4444 (for <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">udp</span>)</p>
<p><span class="GINGER_SOFATWARE_correct">one</span> <span class="GINGER_SOFATWARE_correct">port</span> could listen on TCP and UDP together.</p>
