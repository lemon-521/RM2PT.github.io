---
layout: post
title: Share latex on Ubuntu 12.04
date: 2014-06-10 02:29:11.000000000 +08:00
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
  geo_public: '0'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<h2>Node.js</h2>
<p>[code lang=bash]<br />
sudo apt-get install python-software-properties<br />
sudo add-apt-repository ppa:chris-lea/node.js<br />
sudo apt-get update<br />
sudo apt-get install nodejs<br />
node -v<br />
npm -v<br />
[/code]</p>
<h2>grunt-cli (grunt running tools, npm install project dependency)</h2>
<p>[code lang=bash]<br />
npm install -g grunt-cli<br />
[/code]</p>
<h2>Mongdb</h2>
<p>[code lang=bash]<br />
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10<br />
echo &#039;deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen&#039; | sudo tee /etc/apt/sources.list.d/mongodb.list<br />
apt-get update<br />
apt-get install mongodb-org<br />
update-rc.d mongdb default<br />
/etc/init.d/mongod start<br />
[/code]</p>
<h2>texlive</h2>
<p>[code lang=bash]<br />
sudo add-apt-repository ppa:texlive-backports/ppa<br />
sudo apt-get update<br />
sudo apt-get install texlive<br />
[/code]</p>
<p>but texlive is 2012, you can install 2013 by install-tlperl script</p>
<p>[code lang=bash]<br />
rm -rf /usr/local/texlive/2013<br />
rm -rf ~/.texlive2013<br />
./install-tl -gui text<br />
[/code]</p>
<p>vim /etc/environments</p>
<p>[code lang=text]<br />
LC_ALL=&quot;en.US.UTF-8&quot;<br />
PATH=/usr/local/texlive/2013/bin/i386-linux:$PATH (maybe 64)<br />
[/code]</p>
<h2>redis</h2>
<p>[code lang=bash]<br />
sudo add-apt-repository -y ppa:rwky/redis<br />
sudo apt-get update<br />
sudo apt-get install -y redis-server<br />
[/code]</p>
<h2>sharelatex</h2>
<p>[code lang=bash]<br />
git clone https://github.com/sharelatex/sharelatex.git<br />
cd sharelatex<br />
npm install<br />
grunt install<br />
grunt check --force<br />
grunt run<br />
[/code]</p>
<p>if error, rm -rf web/node_modules/bcrypt, then grunt install again.</p>
