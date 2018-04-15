---
layout: post
title: Install Ubuntu, NLAMP(nginx+apache)basic configuration, juju, bitnami, joomla,
  drupal, gitlab, media wiki, jdk and glassfish.
date: 2013-10-19 02:36:15.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [System, Linux]
tags: []
meta:
  _publicize_pending: '1'
  _oembed_b652c9403fe0628f530a0080065f6a2c: "{{unknown}}"
  _oembed_aea595fb329aa1987158fd0a318f205e: "{{unknown}}"
  _oembed_ee995ebcdae46185b3fa86c66a571d63: "{{unknown}}"
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p><span style="font-size:18pt;">Install Ubuntu, NLAMP<span class="GINGER_SOFATWARE_correct">(</span>nginx+apache<span class="GINGER_SOFATWARE_correct">)</span>basic configuration, <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">juju</span>, <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">bitnami</span>, <span class="GINGER_SOFATWARE_correct">joomla</span>, <span class="GINGER_SOFATWARE_correct">drupal</span>, <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">gitlab</span>, media wiki, <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">jdk</span> and <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">glassfish</span>.<br /> </span></p>
<h1>JUJU</h1>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">For command add-<span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">repo</span><br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">sudo</span> apt-get install python-software-properties<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Set <span class="GINGER_SOFATWARE_correct">root passwd</span><br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">Sudo</span> <span class="GINGER_SOFATWARE_correct">passwd</span> root<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Configure <span class="GINGER_SOFATWARE_correct">juju</span> for <span class="GINGER_SOFATWARE_correct">localuse</span><br /> </span></div>
<p style="text-align:justify;"><a href="https://juju.ubuntu.com/docs/config-local.html"><span style="font-size:10pt;">https://juju.ubuntu.com/docs/config-local.html</span></a><span style="font-size:10pt;"><br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">or</span><br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">install</span> <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">bitnami</span> and run it.<br /> </span></p>
<p style="text-align:justify;"> </p>
<p style="text-align:justify;"><span style="font-size:10pt;">Or you can install lamp stack first. Then install modules<br /> </span></p>
<p style="text-align:justify;"> </p>
<p style="text-align:justify;"><a href="http://wiki.bitnami.com/Native_Installers_Quick_Start_Guideffsdfs"><span style="font-size:10pt;">http://wiki.bitnami.com/Native_Installers_Quick_Start_Guideffsdfs</span></a><span style="font-size:10pt;"><br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Install by hand for one server.<br /> </span></div>
</li>
</ol>
<p>Summary for <span class="GINGER_SOFATWARE_correct">see</span> the function user <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">bitnami</span>, for lots of computer use <span class="GINGER_SOFATWARE_correct">juju</span>. For one server build by hand.</p>
<h1>LAMP and Recover <span class="GINGER_SOFATWARE_correct">joomla</span>, install <span class="GINGER_SOFATWARE_correct">drupal</span></h1>
<h2>Copy files and <span class="GINGER_SOFATWARE_correct">datebase</span>;</h2>
<ul>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">mysqldump --user=root -p mydb &gt; /backup/mydb.sql<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">mysql -u root -p <span class="GINGER_SOFATWARE_spelling">mydb</span> &lt; /backup/mydb.sql<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">mysqldump</span> --user=root -p --all-databases &gt; /backup/mysql.sql<br /> </span></div>
</li>
</ul>
<h2>Basic management</h2>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">dpkg</span> –l<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">apt</span>-get remove *** , then apt-get autoremove<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">delete</span> <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">juju</span> just, apt-get remove <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">mongodb</span> <span class="GINGER_SOFATWARE_correct">,</span>then apt-get autoremove<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">apt</span>-get install <span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">nginx</span> mysql-server apache2<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">all</span> <span class="GINGER_SOFATWARE_correct">configuration</span> in /etc/xxxx<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">configure</span> apache port to 8080 /etc/apache2/ports<span class="GINGER_SOFATWARE_correct">.</span><span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">conf</span> and change *<span class="GINGER_SOFATWARE_correct">:</span>80 to *<span class="GINGER_SOFATWARE_correct">:</span>8080<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">apt</span>-get install sysv-<span class="GINGER_SOFATWARE_correct">rc</span>-<span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">conf</span><br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">mysql_secure_installation<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">change</span> index.php at /etc/apache2/mods-enabled/<span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">dir</span><span class="GINGER_SOFATWARE_correct">.</span><span class="GINGER_SOFATWARE_noSuggestion GINGER_SOFATWARE_correct">conf</span><br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">apt</span>-get install php5 libapache2-mod-php5 php5-mysql<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">apt</span>-cache search php5, then install module if you need<br /> </span></div>
<p style="text-align:justify;"><img alt="" src="{{ site.baseurl }}/assets/101813_1836_installubun1.png" /><span style="font-size:10pt;"><br /> </span></p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">So apt-get install php5-gd, then service apache2 reload<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span style="color:red;">chmod a+w sites/default/, then after install chmod go-w sites/default/</span><br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span class="GINGER_SOFATWARE_correct">copy</span> settings<br /> </span></div>
</li>
</ol>
<p><img alt="" src="{{ site.baseurl }}/assets/101813_1836_installubun2.png" /></p>
</li>
</ol>
<h2>Create new database and user:</h2>
<p style="margin-left:18pt;">grant all on 数据库.表(*.*) to user identified by 'password' with grant option</p>
<p style="margin-left:18pt;">flush privileges</p>
<p style="margin-left:18pt;">DROP {DATABASE | SCHEMA} [IF EXISTS] db_name</p>
<p style="margin-left:18pt;"><img alt="" src="{{ site.baseurl }}/assets/101813_1836_installubun3.png" /></p>
<p style="margin-left:18pt;"> </p>
<h2>Open error_report at one page</h2>
<p style="margin-left:18pt;"><span style="color:#222222;font-family:Lucida Console;font-size:9pt;"><span style="background-color:#f6f6f2;">&lt;?php</span><br /><span style="background-color:#f6f6f2;">error_reporting(E_ALL);</span><br /><span style="background-color:#f6f6f2;">ini_set('display_errors', TRUE);</span><br /><span style="background-color:#f6f6f2;">ini_set('display_startup_errors', TRUE);</span></span></p>
<p style="margin-left:18pt;"> </p>
<p style="margin-left:18pt;"> </p>
<p style="margin-left:18pt;"> </p>
<h1>backup and recover gitlab install new one 5.0</h1>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">preliminary:<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl git-core openssh-server redis-server postfix checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">if you want send mail use other smtp, not install postfix<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">ruby<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">mkdir /tmp/ruby &amp;&amp; cd /tmp/ruby<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">curl --progress http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p327.tar.gz | tar xz<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">cd ruby-1.9.3-p327<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">./configure<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">make<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo make install<br /> </span></p>
<p style="text-align:justify;"> </p>
<p style="text-align:justify;"><span style="font-size:10pt;">Install the Bundler Gem:<br /> </span></p>
<p style="text-align:justify;"> </p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">sudo gem install bundler<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">System Users<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo adduser --disabled-login --gecos 'GitLab' git<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Gitlab shell<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">export GIT_SSL_NO_VERIFY=1, when verification failure<br /> </span></p>
</li>
</ol>
<p>sudo su git</p>
<p>cd /home/git</p>
<p>git clone https://github.com/gitlabhq/gitlab-shell.git</p>
<p>cd gitlab-shell</p>
<p>git checkout v1.1.0</p>
<p>git checkout -b v1.1.0</p>
<p>cp config.yml.example config.yml</p>
<p>vim config.yml</p>
<p>change localhost to domain for now ip</p>
<p>./bin/install</p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Database – Mysql<br /> </span></div>
</li>
</ol>
<p>mysql&gt; CREATE USER 'gitlab'@'localhost' IDENTIFIED BY '$password';</p>
<p style="margin-left:11pt;">mysql&gt; CREATE DATABASE IF NOT EXISTS `gitlabhq_production` DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;</p>
<p style="margin-left:11pt;">mysql&gt; GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON `gitlabhq_production`.* TO 'gitlab'@'localhost';</p>
<p style="margin-left:11pt;">sudo -u git -H mysql -u gitlab -p -D gitlabhq_production</p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Gitlab<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo su git<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">git clone https://github.com/gitlabhq/gitlabhq.git gitlab<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">exit<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">cd /home/git/gitlab<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H cp config/gitlab.yml.example config/gitlab.yml<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H vim config/gitlab.yml change localhost<br /> </span></p>
</li>
</ol>
<p>sudo chown -R git log/</p>
<p>sudo chown -R git tmp/</p>
<p>sudo chmod -R u+rwX log/</p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">sudo chmod -R u+rwX tmp/<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">sudo -u git -H mkdir /home/git/gitlab-satellites<br /> </span></p>
<p>sudo -u git -H mkdir tmp/pids/</p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">sudo chmod -R u+rwX tmp/pids/<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">sudo -u git -H cp config/unicorn.rb.example config/unicorn.rb<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">sudo -u git cp config/database.yml.mysql config/database.yml change database connection<br /> </span></p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Install Gems<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo gem install charlock_holmes --version '0.6.9'<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H bundle install --deployment --without development test postgres<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">if have mysql2 problem install<br /> </span></p>
</li>
</ol>
<pre><code><span style="color:black;font-family:Consolas;font-size:10pt;">sudo apt-<span style="color:darkblue;">get<span style="color:black;"> install libmysqlclient-dev
</span></span></span></code></pre>
<p style="text-align:justify;margin-left:18pt;"><span style="color:red;font-size:10pt;">change Gemfile without http://<br /> </span></p>
<p><span style="color:red;">sudo –u git –H git config --global http.sslverify false<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">     <br /> </span></p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Initialise Database and Activate Advanced Features<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H bundle exec rake gitlab:setup RAILS_ENV=production<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Install Init Script<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo curl --output /etc/init.d/gitlab https://raw.github.com/gitlabhq/gitlab-recipes/5-0-stable/init.d/gitlab<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo chmod +x /etc/init.d/gitlab<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo update-rc.d gitlab defaults 21<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Check all things done<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;"><a name="OLE_LINK7"></a>sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production<br /> </span></p>
<p style="text-align:justify;"> </p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H git config --global user.name "GitLab"<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H git config --global user.email "gitlab@localhost"<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo -u git -H bundle exec rake sidekiq:start RAILS_ENV=production<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Start<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">/etc/init.d/gitlab start<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Install web containter<br /> </span></div>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Nginx<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo apt-get install nginx<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo curl --output /etc/nginx/sites-available/gitlab https://raw.github.com/gitlabhq/gitlab-recipes/5-0-stable/nginx/gitlab<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo ln -s /etc/nginx/sites-available/gitlab /etc/nginx/sites-enabled/gitlab<br /> </span></p>
<p style="text-align:justify;"> </p>
<p style="text-align:justify;"><span style="font-size:10pt;"># Change **YOUR_SERVER_IP** and **YOUR_SERVER_FQDN**<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;"># to the IP address and fully-qualified domain name<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;"># of your host serving GitLab<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">sudo vim /etc/nginx/sites-available/gitlab<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">sudo service nginx restart<br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Apache<br /> </span></div>
</li>
</ol>
<p>sudo gem install passenger</p>
<p style="text-align:justify;margin-left:21pt;"><span style="font-size:10pt;">sudo apt-get install apache2-threaded-dev libapr1-dev libaprutil1-dev<br /> </span></p>
<p style="text-align:justify;margin-left:21pt;"><span style="font-size:10pt;">sudo passenger-install-apache2-module <span style="color:red;">-- for configuration<br /> </span></span></p>
<p style="text-align:justify;margin-left:21pt;"><span style="font-size:10pt;">edit apache load module<br /> </span></p>
</li>
</ol>
<p>13． Admin</p>
<p><a name="OLE_LINK1"></a>admin@local.host</p>
<p><a name="OLE_LINK5"></a>5iveL!fe</p>
<h2>Create a backup of the GitLab system</h2>
<p><span style="color:#333333;font-family:Helvetica;font-size:11pt;">Path define in config/gitlab.yml, default path tmp/backups<br /> </span></p>
<p style="background:#f8f8f8;"><span style="color:#333333;font-family:Consolas;font-size:9pt;">bundle exec rake gitlab:backup:create RAILS_ENV=production<br /> </span></p>
<h2><a name="restore-a-previously-created-backup"></a>Restore a previously created backup</h2>
<p style="background:#f8f8f8;"><span style="color:#333333;font-family:Consolas;font-size:9pt;">bundle exec rake gitlab:backup:restore RAILS_ENV=production<br /> </span></p>
<p><span style="color:#333333;font-family:Helvetica;font-size:11pt;">Options:<br /> </span></p>
<p style="background:#f8f8f8;"><span style="color:#333333;font-family:Consolas;font-size:9pt;">BACKUP=timestamp_of_backup (required if more than one backup exists)<br /> </span></p>
<p style="margin-left:18pt;"> </p>
<p style="margin-left:18pt;">If HEAD different reset it</p>
<pre><code><span style="color:black;font-family:Consolas;font-size:10pt;">git reset --hard xxxx
</span></code></pre>
<p style="background:#eeeeee;"> </p>
<p style="margin-left:18pt;"> </p>
<p style="margin-left:18pt;">for gitlab5.0</p>
<p style="margin-left:18pt;">sudo vim lib/tasks/gitlab/backup.rake</p>
<p style="margin-left:18pt;">160-161</p>
<pre><code><span style="color:#333333;font-family:Consolas;font-size:9pt;">path_to_repo <strong>=</strong>
					<span style="color:teal;">File<span style="color:#333333;"><strong>.</strong>join(repos_path, project<strong>.</strong>path_with_namespace <strong>+</strong>
							<span style="color:#dd1144;">".git"<span style="color:#333333;">)
</span></span></span></span></span></code>
<code><span style="color:#333333;font-family:Consolas;font-size:9pt;"><strong>if</strong>
					<span style="color:teal;">Kernel<span style="color:#333333;"><strong>.</strong>system(<span style="color:#dd1144;">"git clone --bare #{<span style="color:#333333;">path_to_bundle<span style="color:#dd1144;">} #{<span style="color:#333333;">path_to_repo<span style="color:#dd1144;">} &gt; /dev/null 2&gt;&amp;1"<span style="color:#333333;">)
</span></span></span></span></span></span></span></span></span></code></pre>
<p style="margin-left:18pt;">if wiki not show run:</p>
<p style="margin-left:18pt;">sudo -u git -H bundle exec rake gitlab:wiki:migrate RAILS_ENV=production</p>
<p style="background:white;"><span style="color:#333333;"><span style="font-family:Helvetica;font-size:11pt;"><strong>Error:</strong> link_to helper failed with routing error after upgrade to GitLab 5 <br /><strong>Problem:</strong> Some users have no </span><span style="font-family:Consolas;font-size:9pt;background-color:#f8f8f8;">username</span><span style="font-family:Helvetica;font-size:11pt;"> field filled. <br /><strong>Solution:</strong> Fill </span><span style="font-family:Consolas;font-size:9pt;background-color:#f8f8f8;">username</span><span style="font-family:Helvetica;font-size:11pt;"> field.<br /> </span></span></p>
<p style="background:white;"><span style="color:#333333;font-family:Helvetica;font-size:11pt;">Typical way:<br /> </span></p>
<pre><code><span style="color:teal;font-family:Consolas;font-size:10pt;">RAILS_ENV<span style="color:#333333;"><strong>=</strong>production bundle <span style="color:#0086b3;">exec <span style="color:#333333;">rails console
</span></span></span></span></code>
<code><span style="color:teal;font-family:Consolas;font-size:10pt;">User<span style="color:#333333;"><strong>.</strong>where(<span style="color:#990073;">:username<span style="color:#333333;">
								<strong>=&gt;</strong>
								<strong>nil</strong>)<strong>.</strong>each { <strong>|</strong>u<strong>|</strong> u<strong>.</strong>username <strong>=</strong> u<strong>.</strong>email<strong>.</strong>sub(<span style="color:#009926;">/@.+/<span style="color:#333333;">, <span style="color:#dd1144;">''<span style="color:#333333;">); u<strong>.</strong>save! }
</span></span></span></span></span></span></span></span></code></pre>
<p style="margin-left:18pt;"> </p>
<p><span style="color:black;font-size:10pt;"><span style="font-family:Arial;">If you attempt to push a large set of changes to a Git repository with HTTP or HTTPS, you may get an error message such as error: </span><span style="font-family:Consolas;background-color:#eeeeee;">RPC failed; result=22, HTTP code = 411</span><span style="font-family:Arial;">. This is caused by a Git configuration default which limits certain HTTP operations to 1 megabyte.<br /> </span></span></p>
<p><span style="color:black;font-family:Arial;font-size:10pt;">To change this limit run within your local repository<br /> </span></p>
<pre><code><span style="color:black;font-family:Consolas;font-size:10pt;">git config http.postBuffer *bytes*
</span></code></pre>
<p><span style="color:black;font-family:Arial;font-size:10pt;">where bytes is the maximum number of bytes permitted.<br /> </span></p>
<div>
<table style="border-collapse:collapse;" border="0">
<col style="width:832px;" />
<tbody valign="top">
<tr>
<td style="border:none;">
<p><a title="short permalink to this answer" href="http://stackoverflow.com/a/12651825"><span style="color:#888888;font-family:Arial;font-size:9pt;">share</span></a><span style="color:#cccccc;font-family:Arial;"><span style="font-size:10pt;">|</span><span style="color:#888888;font-size:9pt;">improve this answer<span style="color:black;"><br /> </span></span></span></p>
<p><span style="color:black;font-family:Arial;font-size:9pt;">411 ERROR</span></p>
</td>
</tr>
</tbody>
</table>
</div>
<p style="margin-left:18pt;"><span style="color:#333333;font-family:Arial;font-size:10pt;"><span style="background-color:#fefdfa;"><strong><a name="OLE_LINK9"></a>[http]</strong></span><br /><span style="background-color:#fefdfa;"><strong>  postBuffer = 104857600</strong></span></span></p>
<p>433 Error</p>
<p style="margin-left:18pt;">And set nginx http upload max</p>
<p style="margin-left:18pt;">client_max_body_size 4000m;</p>
<p style="margin-left:18pt;"> </p>
<p style="margin-left:18pt;"> </p>
<p style="margin-left:18pt;">time problem:</p>
<p style="margin-left:18pt;">date –set "10/11/2013 18:02"</p>
<p style="margin-left:18pt;">sudo hwclock –systohc</p>
<p style="margin-left:18pt;"> </p>
<h1>Install mediawiki</h1>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Download to LAMP environment<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Apt-get install php5-intl php-apc<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Create database, user<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Install by brower<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Configure LocalSettings.php<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">$wgGroupPermissions['*']['edit'] = false;<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">$wgGroupPermissions['*']['createaccount'] = false;<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">$wgGroupPermissions['*' ]['read'] = false;<br /> </span></p>
</li>
</ol>
<h1>Create virtual host for domain</h1>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Add ServerName to apache<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Add virtualhost to site-avaible the make symbolic link from site-enables<br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">&lt;VirtualHost *:8080&gt;<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">DocumentRoot /var/www/um<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">ServerName um.mydreamy.cn<br /> </span></p>
<p style="text-align:justify;"><span style="font-size:10pt;">&lt;/VirtualHost&gt;<br /> </span></p>
</li>
</ol>
<p style="text-align:justify;margin-left:18pt;"> </p>
<h1>Configure nginx with apache</h1>
<p>Server { is the virtual host</p>
<p>Server name</p>
<p>root</p>
<p>}</p>
<p>For default file</p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Add default-server behind listen 80<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Server name xxxxx mydreamy.cn<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Remove default-server from gitlab file add git.mydreamy.cn to server name<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Add forward configuration<br /> </span></div>
</li>
</ol>
<p>server {</p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;"> server_name www.mydreamy.cn;<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;"> location / {<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;"> proxy_pass http://127.0.0.1:8080;<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;"> proxy_set_header Host $host;<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;"> }<br /> </span></p>
<p style="text-align:justify;margin-left:18pt;"><span style="font-size:10pt;">}<br /> </span></p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Then gitlab on nginx, all other domain forward to apache. <a href="http://xxx:8080">http://xxx:8080</a><br /> </span></div>
</li>
</ol>
<h1>Install oracle-jdk-7</h1>
<p><span style="color:#666666;font-family:Arial;font-size:9pt;"><em><span style="background-color:#e6e6e6;">add-apt-repository ppa:webupd8team/java</span><br /><span style="background-color:#e6e6e6;">apt-get update &amp;&amp; sudo apt-get install oracle-jdk7-installer<br /> </span></em></span></p>
<p><span style="color:#666666;font-family:Arial;font-size:9pt;background-color:#e6e6e6;"><em>update-alternatives –display java<br /> </em></span></p>
<p><span style="color:#666666;font-family:Arial;font-size:9pt;background-color:#e6e6e6;"><em>java –version<br /> </em></span></p>
<p><span style="color:#666666;font-family:Arial;font-size:9pt;"><span style="background-color:#e6e6e6;"><em>sudo gedit /etc/environment    </em></span><span style="color:#201f1f;background-color:#dddddd;">JAVA_HOME=/usr/lib/jvm/java-7-oracle<br /> </span></span></p>
<p><span style="color:#666666;font-family:Arial;font-size:9pt;background-color:#e6e6e6;"><em>sudo apt-get remove oracle-jdk7-installer<br /> </em></span></p>
<h1>Install Glassfish</h1>
<p><img alt="" src="{{ site.baseurl }}/assets/101813_1836_installubun4.png" /></p>
<p><img alt="" src="{{ site.baseurl }}/assets/101813_1836_installubun5.png" /><img alt="" src="{{ site.baseurl }}/assets/101813_1836_installubun6.png" /></p>
<ol>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Download glassfish<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;">Configure domains file<br /> </span></div>
<p style="text-align:justify;"><span style="color:black;font-family:Helvetica;font-size:10pt;background-color:white;">glassfish3/glassfish/domains/domain1/config/domain.xml <br /> </span></p>
</li>
<li>
<div style="text-align:justify;"><span style="color:black;font-family:Helvetica;font-size:10pt;background-color:white;">asadmin enable-secure-admin change password<br /> </span></div>
</li>
<li>
<div style="text-align:justify;"><span style="font-size:10pt;"><span style="color:black;font-family:Helvetica;"><span style="background-color:white;">Start./asadmin start-domain domain1 </span><br /><span style="background-color:white;">Stop ./asadmin stop-domain domain1 </span></span><br /> </span></div>
<p style="text-align:justify;"><span style="font-size:10pt;">LIST ./asadmin domains-list</span></p>
</li>
</ol>
