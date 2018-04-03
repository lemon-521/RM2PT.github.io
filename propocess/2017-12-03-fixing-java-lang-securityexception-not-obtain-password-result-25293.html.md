---
layout: post
title: 'Fixing: java.lang.SecurityException: Could not obtain password.  Result: -25293'
date: 2017-12-03 10:14:59.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Eclipse RCP
tags:
- eclipse
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '60'
  _yoast_wpseo_primary_category: '148'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<p>This is the message I see in the eclipse Error log.</p>
<p><em>Secure storage was unable to retrieve the master password from the OS keyring. Make sure that this application has access to the OS keyring. If the error persists, the password recovery feature could be used, or secure storage can be deleted and re-created.</em></p>
<p>So as others said if you delete the <span style="color: #ff0000;"><em><strong>secure_storage</strong></em></span> file and it should solve the problem. On a mac, better use command line.</p>
<pre class="lang-java prettyprint prettyprinted"><code><span class="pun">/</span><span class="typ">Users</span><span class="pun">/&lt;</span><span class="pln"> userid </span><span class="pun">&gt;/.</span><span class="pln">eclipse</span><span class="pun">/</span><span class="pln">org</span><span class="pun">.</span><span class="pln">eclipse</span><span class="pun">.</span><span class="pln">equinox</span><span class="pun">.</span><span class="pln">security</span></code></pre>
