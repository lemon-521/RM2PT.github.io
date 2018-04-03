---
layout: post
title: MySQL Login Problem (ERROR 1449)
date: 2018-01-02 13:09:03.000000000 +08:00
type: post
password: ''
status: publish
categories: [Programming, Database]
tags: mysql
author: yylonly
---

> 'Mysql Problem (ERROR 1449 (HY000): The user specified as a definer (''root''@''localhost'') does not exist)'

> select host,user from user;

root <-> localhost pair dose not exist, then add root <-> localhost pair

> mysql -u root -p

work well now

> mysqldump -u root -p ehr > ehr.sql
>
> mysql -u root -p ehr < ehr.sql
