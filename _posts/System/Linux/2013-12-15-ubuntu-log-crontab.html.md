---
layout: post
title: ubuntu log crontab
date: 2013-12-15 01:36:39.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags:
- backup
- log
- ubuntu
meta:
  _publicize_pending: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>修改rsyslog文件，将/etc/rsyslog.d/50-default.conf 文件中的#cron.*前的#删掉； 重启rsyslog服务service rsyslog restart； 重启cron服务service cron restart；</p>
<p>0 0 * * 7 /bin/backup.sh</p>
<p>#!/bin/sh</p>
<p>cd /backup</p>
<p>if [ -d "backup" ]; then<br />
rm -rf backup<br />
fi</p>
<p>mkdir -p backup<br />
cd backup</p>
<p>tar -zcf apache-etc.tar.gz /etc/apache2<br />
tar -zcf php-etc.tar.gz /etc/php5<br />
tar -zcf nginx-etc.tar.gz /etc/nginx<br />
tar -zcf www-data.tar.gz /var/www<br />
mysqldump -u root --password="*" --all-databases &gt; database.sql<br />
cd ..<br />
tar -zcvf backup-$(date +%Y-%m-%d_%H-%M-%S).tar.gz backup<br />
rm -rf backup</p>
