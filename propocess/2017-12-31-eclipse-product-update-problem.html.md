---
layout: post
title: Eclipse Product Update Problem
date: 2017-12-31 15:51:22.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Eclipse RCP
tags:
- java
- pde
meta:
  _edit_last: '1'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>&nbsp;</p>
<ol>
<li>The product (RMCode) is the Root Install Unit (IU) in Eclipse Product, it can not be updated, only can uninstall and install. Only non-IUs can be updated. (RMCode Product 1.0 to 2.0 cannot be triggered, download new IDE)</li>
<li>The feature is non-IUs, therefore the feature of the product can be updated. However, the product configuration file only can define the extract version of feature (code generation) required. Therefore, the new feature in the update-site cannot be updated in the old product.</li>
</ol>
<p>Solution: define a p2.inf file, which describes the support version range [1.0.0, 2.0.0)</p>
<blockquote><p>requires.1.namespace=org.eclipse.equinox.p2.iu</p>
<p>requires.1.name=net.mydreamy.requirementmodel.feature.feature.group</p>
<p>requires.1.range=[1.0.0, 2.0.0)</p></blockquote>
<p>Then, the feature can be updated in the old product version 1 until the version of feature is up to 2.0.0</p>
