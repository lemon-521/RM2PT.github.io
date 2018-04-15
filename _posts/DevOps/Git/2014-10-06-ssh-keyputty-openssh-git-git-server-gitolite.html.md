---
layout: post
title: ssh key(putty, openssh) git git server gitolite
date: 2014-10-06 21:53:09.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [DevOps, Git]
tags:
- git
- git server
- gitolite
- ssh
meta:
  _wpcom_is_markdown: '1'
  geo_public: '0'
  _publicize_job_id: '27186640799'
  _edit_last: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>## SSH Key - Putty OpenSSH (Different Form)<br />
```<br />
brew install putty<br />
brew install ssh-copy-id<br />
puttygen -t rya -C 'Comment' -o test.ppk (private and public key)<br />
puttygen test.ppk -O private-openssh -o test (private key)<br />
puttygen test.ppk -O public-openssh -o test.pub (public key)<br />
ssh-keygen -t rya (generate public and private key)<br />
ssh-keygen -y -f test(openssh private key) &gt; test.pub (private -&gt; public key)<br />
ssh-keygen -y -i test(putty key) &gt; test.pub (private -&gt; public key)<br />
eval $(ssh-agent) //start ssh-agent<br />
ssh-add (test ssh-agent)<br />
ssh-add -l //list all key<br />
ssh-add -L //list details key<br />
ssh-add -d path/file<br />
ssh-add -D //delete all key<br />
```</p>
<p>## git and git server<br />
```<br />
apt-get/brew install git<br />
useradd -m git<br />
passwd git<br />
mkdir ~/projects/projectrepo<br />
git --bare init<br />
cp (all user`s public key) into /home/git/.ssh/authorized_keys (openssh form)<br />
git clone git@hosts:projects/projectrepo<br />
```</p>
<h2>gitolite (auth layer on git)</h2>
<ul>
<li>clear /home/git/.ssh/authorized_keys, then install gitolite</li>
</ul>
<p>[code lang=bash]<br />
git clone git://github.com/sitaramc/gitolite<br />
mkdir -p $HOME/bin<br />
gitolite/install -to $HOME/bin<br />
add $HOME/bin to $PATH<br />
[/code]</p>
<ul>
<li>setup admin public key</li>
</ul>
<p>[code lang=bash]<br />
gitolite setup -pk YourName.pub<br />
[/code]</p>
<ul>
<li>Clone gitolite-admin</li>
</ul>
<p>[code lang=bash]<br />
git clone git@hosts:gitolite-admin<br />
[/code]</p>
<ul>
<li>add your public key to keydir/ and user configure to /conf/gitolite.conf</li>
</ul>
<p>[code lang=text]<br />
@staff = alice bob carol<br />
@interns = ashok</p>
<p>repo secret<br />
RW = @staff</p>
<p>repo foss<br />
RW+ = @staff<br />
RW = @interns<br />
[/code]</p>
<ul>
<li>commit gitolite and push to server<br />
Test use your private key in any git GUI or git command line</li>
</ul>
<h2>automated add to system without ssh-agent</h2>
<p>[code lang=text]<br />
&lt;br /&gt;vim ~/.ssh/config</p>
<p>Host xxxx</p>
<p>IdentityFile ~/.ssh/xxxx</p>
<p>User xxx</p>
<p>&nbsp;</p>
<p>[/code]</p>
