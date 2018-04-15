---
layout: post
title: Mysql INNOB recovery
date: 2015-06-23 18:35:36.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Database]
tags:
- innob
- mysql
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_job_id: '11951320646'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>Mysql Engine<br />
1. INNOB .Frm(scheme) .ib*(index, data)<br />
2. MyISAM .Frm .MYI(index) .MYD(data)  defaullt</p>
<p>CREATE TABLE t (i INT) ENGINE = INNODB;<br />
  SET storage_engine=MYISAM;<br />
  ALTER TABLE t ENGINE = MYISAM;</p>
<p>Can not start, with error log:<br />
InnoDB: Starting crash recovery.<br />
InnoDB: Reading tablespace information from the .ibd files...<br />
InnoDB: Restoring possible half-written data pages from the doublewrite<br />
InnoDB: buffer...<br />
InnoDB: Doing recovery: scanned up to log sequence number 1982480891<br />
InnoDB: 1 transaction(s) which must be rolled back or cleaned up<br />
InnoDB: in total 1 row operations to undo<br />
InnoDB: Trx id counter is 8C9C00<br />
150623 15:42:37  InnoDB: Starting an apply batch of log records to the database...<br />
InnoDB: Progress in percents: 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99<br />
InnoDB: Apply batch completed<br />
150623 15:42:37  InnoDB: Waiting for the background threads to start<br />
InnoDB: Starting in background the rollback of uncommitted transactions<br />
150623 15:42:37  InnoDB: Rolling back trx with id 8C9AA9, 1 rows to undo<br />
150623 15:42:37  InnoDB: Assertion failure in thread 140516044236544 in file fut0lst.ic line 83<br />
InnoDB: Failing assertion: addr.page == FIL_NULL || addr.boffset &gt;= FIL_PAGE_DATA<br />
InnoDB: We intentionally generate a memory trap.</p>
<p>Recovery<br />
1. mysqlcheck for all databases<br />
2. innodb_force_recovery = 4 (0-6), then start mysql<br />
3. mysqldump -h -u root -p -A &gt; dump.sql<br />
4. stop mysql, backup and delete *ib files<br />
5. start mysql, with warning<br />
6. mysql -h -u root -p &lt; dump.sql</p>
<p>ALL WORK</p>
