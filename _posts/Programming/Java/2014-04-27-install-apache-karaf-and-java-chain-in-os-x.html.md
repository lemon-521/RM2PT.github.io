---
layout: post
title: Install apache karaf and java chain in OS X
date: 2014-04-27 23:50:10.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Programming, Java]
tags: []
meta:
  _publicize_pending: '1'
author:
  login: mcloud
  email: ''
  display_name: mcloud
  first_name: ''
  last_name: ''
---
<p>1. Prepare</p>
<ul>
<li>Download and install java8 .dmg file from Oracle</li>
<li> Running /usr/libexec/java_home get Java home, set that path for variable JAVA_HOME   (-v show all versions on your Mac)</li>
<li>Download Ant and Junit jar in ant lib/optional, then run<span id="52502e22-eb57-4cdd-bdf3-71a840976bfb" class="GINGER_SOFTWARE_mark"><span id="62d91392-70dd-4a11-b514-b49f802e8cc6" class="GINGER_SOFTWARE_mark"><span id="c492b968-d0d1-45bc-8eb9-eb39c82a9d2a" class="GINGER_SOFTWARE_mark"><span id="24bf7ba4-34ee-4e78-9b2d-b467e94b13bd" class="GINGER_SOFTWARE_mark"> .</span></span></span></span>/Build</li>
<li>Download maven set, and run ant on maven folder.</li>
<li>Export JAVA_HOME=$ (/usr/libexec/java_home -v 1.7)  <span style="color:#ff6600;">(you can change your version here)</span></li>
<li>PATH=$PATH<span id="b4c225ae-b65c-43ff-9892-1c9980d10275" class="GINGER_SOFTWARE_mark"><span id="fa04e5c3-aed8-4c1c-bbd3-acb1c4f5b722" class="GINGER_SOFTWARE_mark"><span id="f45e9032-e993-43fa-8ea8-cd851132e338" class="GINGER_SOFTWARE_mark">:</span></span></span>/var/root/apps/maven/apache-maven-3.0-SNAPSHO/bin<span id="b901a0aa-762f-46b2-807b-5a091bfe9757" class="GINGER_SOFTWARE_mark"><span id="169d9504-589a-4d80-9680-02fe1687c6e1" class="GINGER_SOFTWARE_mark"><span id="0c853424-56be-491e-94fa-2bebff4be847" class="GINGER_SOFTWARE_mark">:</span></span></span>/private/var/root/apache-ant-1.9.3/<span id="1fdf4ee8-84b9-4387-abe9-7ab3475ec215" class="GINGER_SOFTWARE_mark"><span id="0867c5cc-7c5e-4476-a0e4-ed5f18a8c501" class="GINGER_SOFTWARE_mark"><span id="688e816e-3967-4b10-bf30-105c32f4a96c" class="GINGER_SOFTWARE_mark">dist</span></span></span>/bin<span id="9ae4d68f-b0dd-44e6-8b2e-f1a5063b684e" class="GINGER_SOFTWARE_mark"><span id="3375263d-d46a-41ad-9843-5ca56e12647d" class="GINGER_SOFTWARE_mark"><span id="a55e9e5d-127e-4918-a407-02b7fc3950cf" class="GINGER_SOFTWARE_mark">:</span></span></span>$JAVA_HOME/bin</li>
</ul>
<p>2. Install Karaf</p>
<p>Run <span id="1b36a8db-22b9-4775-a4c7-9ca2321e7ee4" class="GINGER_SOFTWARE_mark"><span id="b4fbecc6-d8a1-4bfa-bd83-bc37a4523f3b" class="GINGER_SOFTWARE_mark">mvn</span></span> on <span id="da8c4b49-a4c6-4dc3-90b0-2b3e8073fa2e" class="GINGER_SOFTWARE_mark"><span id="c4251544-6bbe-4a68-a951-db282ac5c2cf" class="GINGER_SOFTWARE_mark">karaf</span></span> folder, <span id="bf90929a-8a53-434b-b149-32cb0614dcf5" class="GINGER_SOFTWARE_mark"><span id="f1d79a29-0b0e-4e75-a35b-a693d1282524" class="GINGER_SOFTWARE_mark">mvn</span></span> will download package they need, compile the source code and test on it.</p>
<p>3. Structure</p>
<p style="color:#000000;">The directory layout of a Karaf installation is as follows:</p>
<ul style="color:#000000;">
<li><tt>/<span id="6cafc269-1eb4-4413-9e00-771bd42e9d21" class="GINGER_SOFTWARE_mark"><span id="6fe9bd91-55fc-4d23-8e7d-b1a28ae05361" class="GINGER_SOFTWARE_mark">bin</span></span></tt>: control scripts to start, stop, <span id="4edd2a79-2c5a-4947-9287-ead7dc5bd692" class="GINGER_SOFTWARE_mark"><span id="6895e7d4-3eda-4622-afde-0120ac4fb7fb" class="GINGER_SOFTWARE_mark">login</span></span>, ...</li>
<li><tt>/<span id="4d5714b3-6924-401b-949c-947ff2616c8b" class="GINGER_SOFTWARE_mark"><span id="663b88a9-fd50-40d8-bbaa-452902edde92" class="GINGER_SOFTWARE_mark">etc</span></span></tt>: configuration files</li>
<li><tt>/<span id="0ac6eb11-7fde-4fdb-a71d-9e701ef6ebaf" class="GINGER_SOFTWARE_mark"><span id="886a572d-5603-4aea-af64-f24c7325e8d5" class="GINGER_SOFTWARE_mark">data</span></span></tt>: working directory
<ul>
<li><tt>/<span id="e63e33fc-6d74-4aea-9a79-17fda4590bcb" class="GINGER_SOFTWARE_mark"><span id="a5bd3446-c865-4ea0-a4ce-d814e9d69a63" class="GINGER_SOFTWARE_mark">cache</span></span></tt>: OSGi framework bundle cache</li>
<li><tt>/<span id="61658b44-bd60-48a3-b2e2-eefa9a8afcfc" class="GINGER_SOFTWARE_mark"><span id="4b75ffcc-3c3b-4126-b6de-4c6f4c770217" class="GINGER_SOFTWARE_mark">generated</span></span>-bundles</tt>: temporary folder used by the <span id="dc222476-ec34-4f98-ae52-ff4843204333" class="GINGER_SOFTWARE_mark"><span id="7de7fa34-75e5-4e1e-8ef2-38a5739fb75c" class="GINGER_SOFTWARE_mark">deployers</span></span></li>
<li><tt>/<span id="252089e7-8120-40f7-9035-06d6b6719d4b" class="GINGER_SOFTWARE_mark"><span id="785c4156-a36e-4939-9408-7257ee66d06c" class="GINGER_SOFTWARE_mark">log</span></span></tt>: log files</li>
</ul>
</li>
<li><tt>/<span id="167ea866-186a-4737-a8f8-cc624869b870" class="GINGER_SOFTWARE_mark"><span id="e3f6a49d-3a91-4ed0-8263-0170ebd8ca31" class="GINGER_SOFTWARE_mark">deploy</span></span></tt>: hot deploy directory</li>
<li><tt>/<span id="116ba3a8-56c7-4369-bb91-18b19f9e1ff4" class="GINGER_SOFTWARE_mark"><span id="6a5d7817-1f24-4485-b551-362f22782df9" class="GINGER_SOFTWARE_mark">instances</span></span></tt>: directory containing <a style="color:#5b8fbe;" href="http://karaf.apache.org/manual/latest/users-guide/instances.html">instances</a></li>
<li><tt>/<span id="9a481625-3670-4fad-a04a-ba7a8fd2fc5b" class="GINGER_SOFTWARE_mark"><span id="b637bd47-9cb8-46ff-af67-42723be81e2e" class="GINGER_SOFTWARE_mark">lib</span></span></tt>: contains the bootstrap libraries
<ul>
<li><tt>/<span id="e01bee6e-f5f6-4450-8191-2a398d113087" class="GINGER_SOFTWARE_mark"><span id="cbe7266d-31d6-42a1-a5e7-5e51d47901e5" class="GINGER_SOFTWARE_mark">lib</span></span>/ext</tt>: directory for JRE extensions</li>
<li><tt>/<span id="bc25e647-9ac5-4df0-9a2f-4b1bda8998fa" class="GINGER_SOFTWARE_mark"><span id="ccd95574-9bf8-407e-a88a-43ab09e013c4" class="GINGER_SOFTWARE_mark">lib</span></span>/endorsed</tt>: directory for <span id="bee25cda-665b-409b-ab2c-f5f7da9167f6" class="GINGER_SOFTWARE_mark"><span id="d6eed8c5-6953-44c3-98a0-d0743271d8e0" class="GINGER_SOFTWARE_mark">endorsed</span></span> libraries</li>
</ul>
</li>
<li><tt>/<span id="5a64c36b-2266-493c-9893-d6ba402bb70b" class="GINGER_SOFTWARE_mark"><span id="1aec18d0-172f-430c-b425-7ba6e37c87ee" class="GINGER_SOFTWARE_mark">system</span></span></tt>: OSGi <span id="4a00e0e0-ce66-449e-bab0-2fe8eb594257" class="GINGER_SOFTWARE_mark"><span id="b51979d6-66bb-4b3d-9236-5ba573713acb" class="GINGER_SOFTWARE_mark">bundles</span></span> repository, laid out as a Maven 2 repository</li>
</ul>
<p>4. <span id="c3076445-0696-4a73-ac97-81252e0205c2" class="GINGER_SOFTWARE_mark"><span id="dfa0a7d6-655b-47df-a827-ca24c429cbc4" class="GINGER_SOFTWARE_mark">test</span></span></p>
<p style="color:#000000;">Deploying all the requirements (bundles and configurations) of an application into a container is called the "provisioning".</p>
<p style="color:#000000;">An OSGi application is a set of OSGi bundles. An OSGi <span id="b798d399-707b-418e-a7de-4b4abeb1093d" class="GINGER_SOFTWARE_mark"><span id="09d9511d-801f-4657-b340-3b638ed3c881" class="GINGER_SOFTWARE_mark">bundles</span></span> is a regular jar file, with additional metadata in the jar MANIFEST.</p>
<p style="color:#000000;">In OSGi, a bundle can depend to other bundles. So, it means that to deploy an OSGi application, most of the time, you have<br />
<span id="05b4e6bb-ad35-4685-9a75-7c060dd00663" class="GINGER_SOFTWARE_mark"><span id="c1c65930-b1af-4b21-8e4c-50e6caf01aec" class="GINGER_SOFTWARE_mark">to</span></span> firstly deploy a lot of other bundles required by the application.</p>
<p>In Apache Karaf, the application provisioning is an Apache Karaf "feature".</p>
<p>A feature describes an application as:</p>
<ul>
<li><span id="a0838f3e-7730-4703-9f2b-b0e35901f14b" class="GINGER_SOFTWARE_mark"><span id="c002ee41-4682-49d5-b0dd-219366012f3c" class="GINGER_SOFTWARE_mark">a</span></span> name</li>
<li><span id="c3940c12-441d-4131-b602-7cd91e71136d" class="GINGER_SOFTWARE_mark"><span id="b529c99c-dc26-464e-b454-1c41b7df138c" class="GINGER_SOFTWARE_mark">a</span></span> version</li>
<li><span id="8f580aa9-5e6e-457e-880c-020d5b3f61f4" class="GINGER_SOFTWARE_mark"><span id="d7a77ccb-bc10-4da2-ad7c-e4c4efedfbb9" class="GINGER_SOFTWARE_mark">a</span></span> optional description (eventually with a long description)</li>
<li><span id="3a491f59-0ebb-4ade-93e7-6afaca6fa352" class="GINGER_SOFTWARE_mark"><span id="25376476-2c8d-4719-ace2-f3df0c52b829" class="GINGER_SOFTWARE_mark">a</span></span> set of bundles</li>
<li><span id="b62dd37b-6a74-411a-a685-7e88405a1bc0" class="GINGER_SOFTWARE_mark"><span id="91889028-aea5-4789-802e-e25df2704563" class="GINGER_SOFTWARE_mark">optionally</span></span> a set <span id="74d9c1f4-2f3b-458d-b59e-631b568fb7e5" class="GINGER_SOFTWARE_mark"><span id="68d5003a-68b6-4444-b4e4-72e5c0d85240" class="GINGER_SOFTWARE_mark">configurations</span></span> or configuration files</li>
<li><span id="8a63a3ad-92f8-47f2-8bdf-ebfb2e5d1073" class="GINGER_SOFTWARE_mark"><span id="b08cfd0a-f39d-47bc-ad20-003a821ba981" class="GINGER_SOFTWARE_mark">optionally</span></span> a set of dependency features</li>
</ul>
<p>When you install a feature, Apache Karaf installs all resources described in the <span id="a8eed36b-1491-4601-b5cf-3b46e6ca24b0" class="GINGER_SOFTWARE_mark"><span id="89491274-ecba-4435-8751-f2c39e4849c4" class="GINGER_SOFTWARE_mark">feature</span></span>. It means that it will<br />
<span id="334e5cbf-4cef-4689-902b-0659d4c93a00" class="GINGER_SOFTWARE_mark"><span id="da1db369-2c7b-4f61-b489-d1d5807eafeb" class="GINGER_SOFTWARE_mark">automatically</span></span> resolves and installs all bundles, configurations, and dependency features described in the <span id="81cb5e0b-c11d-4104-af3a-fc37b9276e56" class="GINGER_SOFTWARE_mark"><span id="a4cc0b8f-3a74-4a4f-8b3c-3ef13d550827" class="GINGER_SOFTWARE_mark">feature</span></span>.</p>
<p style="color:#000000;">By default, Apache Karaf provides a set of <span id="8b7af87d-db3d-4a14-b614-bdac9adf6595" class="GINGER_SOFTWARE_mark"><span id="be9a0def-4b18-4920-9205-d149d8281a81" class="GINGER_SOFTWARE_mark">deployers</span></span>:</p>
<ul style="color:#000000;">
<li>Blueprint <span id="c149b34a-9857-4a6a-808a-7d9ab391d9a6" class="GINGER_SOFTWARE_mark"><span id="19b7d734-c6aa-428f-9d38-c6e4bb0d6443" class="GINGER_SOFTWARE_mark">deployer</span></span> is able to handle Blueprint XML files.</li>
<li>Spring <span id="af05b1e8-6c29-4904-8e53-0eaec6f04155" class="GINGER_SOFTWARE_mark"><span id="a58a4361-1da5-42fe-aef9-9e7671442729" class="GINGER_SOFTWARE_mark">deployer</span></span> is able to handle Spring XML files.</li>
<li>Features <span id="a1035450-88eb-4d71-88fc-94f4e260edc0" class="GINGER_SOFTWARE_mark"><span id="486da665-bed4-4367-b0e0-b2301aadcb20" class="GINGER_SOFTWARE_mark">deployer</span></span> is able to <span id="519eaca4-3c07-4b43-a2d5-43e58124a799" class="GINGER_SOFTWARE_mark"><span id="8e0691fc-3db1-4110-94cf-7bbb959c56de" class="GINGER_SOFTWARE_mark">handle Apache</span></span> Karaf features XML files (see <a style="color:#5b8fbe;" href="http://karaf.apache.org/manual/latest/users-guide/provisioning.html">Provisioning section</a> for details).</li>
<li>KAR <span id="69367476-7078-422b-89b3-6e22eb77482d" class="GINGER_SOFTWARE_mark"><span id="f8afd796-6561-4ca5-8656-f82e47394b73" class="GINGER_SOFTWARE_mark">deployer</span></span> is able to handle KAR files (see <a style="color:#5b8fbe;" href="http://karaf.apache.org/manual/latest/users-guide/kar.html">KAR section</a> for details).</li>
<li>Wrap <span id="27dbaad8-6f5c-425d-a00c-365d7933dfc7" class="GINGER_SOFTWARE_mark"><span id="95892665-8b6d-459f-811a-ac4d1e21b304" class="GINGER_SOFTWARE_mark">deployer</span></span> is able to handle non-OSGi jar files and turns it as OSGi bundles "on the fly".</li>
<li>Optionally, WAR <span id="541d05cf-dbed-4054-89c7-048a8a87cfaf" class="GINGER_SOFTWARE_mark"><span id="fa18605c-3070-42bd-825a-bb904ff1669e" class="GINGER_SOFTWARE_mark">deployer</span></span> (if you install the war feature) is able to handle WAR files.</li>
</ul>
<p style="color:#000000;">Apache Karaf provides a special type of artifact that package a features XML and all resources described in the features<br />
<span id="098799ea-f0b3-4e78-a67c-43413ef6f92a" class="GINGER_SOFTWARE_mark"><span id="66325312-1bfd-495d-ae45-36735717b60d" class="GINGER_SOFTWARE_mark">of</span></span> this XML. This artifact is named a KAR (KAraf <span id="3345a779-415d-4881-83ea-c4418c20cfb8" class="GINGER_SOFTWARE_mark"><span id="51fd1498-ccc5-4f9c-b6a9-b47e96b2c73b" class="GINGER_SOFTWARE_mark">aRchive</span></span>).</p>
<p style="color:#000000;">A KAR file is a zip archive containing the</p>
<p style="color:#000000;">Basically, the <span id="85cbd114-4b21-479b-bcbc-f3e857507e62" class="GINGER_SOFTWARE_mark"><span id="bf0e68e8-3224-49e0-a799-86c276bee84e" class="GINGER_SOFTWARE_mark">kar</span></span> format is a jar (so a zip file) which contains a set of feature descriptor and bundle jar files.</p>
<p style="color:#000000;">A KAR file contains a <tt>repository</tt> folder containing:</p>
<ul style="color:#000000;">
<li><span id="3a0f343c-fa8b-4d58-9244-3a08ec5c4eb0" class="GINGER_SOFTWARE_mark"><span id="0183b36b-5ed6-4c45-aed2-ad4bc08fd6aa" class="GINGER_SOFTWARE_mark">a</span></span> set of features XML files</li>
<li><span id="92ead45c-bff8-4ba4-b78b-05f09551a4b9" class="GINGER_SOFTWARE_mark"><span id="9da04589-b75d-43b3-8a0e-f47782c373ed" class="GINGER_SOFTWARE_mark">the</span></span> artifacts following the Maven directory structure (<tt>groupId/artifactId/version/<span id="45777a9b-eceb-4220-b92c-2b3fb30818d5" class="GINGER_SOFTWARE_mark"><span id="a6de7b7a-da27-43e4-b03a-f7558dc7e3e3" class="GINGER_SOFTWARE_mark">artifactId</span></span>-version<span id="68506ed3-d0c6-43ca-a084-d349002057c8" class="GINGER_SOFTWARE_mark"><span id="3d1b3ab4-649f-4e5e-b85b-191992498485" class="GINGER_SOFTWARE_mark">.</span></span>type</tt>).</li>
</ul>
<p style="color:#000000;"><span id="d40c45a7-0792-41b5-88d3-1e21fb725f4a" class="GINGER_SOFTWARE_mark"><span id="3ad4ea76-115c-4f12-9e38-7fc7fbb5af1d" class="GINGER_SOFTWARE_mark">A</span></span> instance is a complete new Apache Karaf runtime, isolated from the other ones.</p>
<p style="color:#000000;">The purpose is to easily create and manage a new Apache Karaf runtime without installing a complete distribution.<br />
<span id="92c081a0-f939-4164-a5b1-e2d3eda81aab" class="GINGER_SOFTWARE_mark"><span id="cc7e9bad-e877-4125-be9a-ea55715cf5b3" class="GINGER_SOFTWARE_mark">A</span></span> instance</p>
<p style="color:#000000;"><span id="e0fa2e7d-19af-4862-955b-40e6233c1faf" class="GINGER_SOFTWARE_mark"><span id="aaff79ec-e231-42e7-95ed-895d30b3f790" class="GINGER_SOFTWARE_mark">A</span></span> instance is a new instance that you can launch separately from the root one, and deploy applications into.</p>
<p style="color:#000000;">An instance does not contain a full copy of the Apache Karaf distribution, but only a set of the configuration files and data folder which contains all the runtime information, logs and temporary files.</p>
<p><span id="8c95396b-5f05-4495-8b19-c1c4a7a98977" class="GINGER_SOFTWARE_mark"><span id="97054571-3522-4b2c-8ec3-5e908401fd2d" class="GINGER_SOFTWARE_mark">pache</span></span> Karaf provides an advanced and flexible security system, powered by JAAS (Java Authentication and Authorization<br />
Service) in an OSGi compliant way.</p>
<p>It provides a dynamic security system.</p>
<p>The Apache Karaf security framework is used internally to control the access to:</p>
<ul>
<li><span id="9d1e5e5d-e7c7-41f7-804d-7480dcf48dfd" class="GINGER_SOFTWARE_mark"><span id="21b372d2-288f-4a3a-99aa-91ba1e46df00" class="GINGER_SOFTWARE_mark">the</span></span> OSGi services (described in the developer guide)</li>
<li><span id="24e4716e-f975-4143-b8d2-c72cd9ffc7d1" class="GINGER_SOFTWARE_mark"><span id="ac7a4b63-5b8c-4076-abbd-160c1d62ab96" class="GINGER_SOFTWARE_mark">the</span></span> console commands</li>
<li><span id="06ea67c7-29e0-4e8a-83ee-5002d2691497" class="GINGER_SOFTWARE_mark"><span id="2840b9c2-7d94-4b8f-8023-91c0b87c150a" class="GINGER_SOFTWARE_mark">the</span></span> JMX layer</li>
<li><span id="0b1430ec-1b52-4abb-8371-86da8ec3efd7" class="GINGER_SOFTWARE_mark"><span id="d642f0cd-61b6-4a3b-badf-04083ac2c506" class="GINGER_SOFTWARE_mark">the</span></span> WebConsole</li>
</ul>
<p>Your applications can also use the security framework (see the developer guide for details).</p>
<p>&nbsp;</p>
<p style="color:#000000;">The goal of OBR (OSGi Bundle Repository) is:</p>
<p style="color:#000000;">1. <span id="6be2fc62-ed0d-491e-9063-bb12fb6843fe" class="GINGER_SOFTWARE_mark"><span id="46edda1f-7088-4263-9ca3-8781bbb0c1e6" class="GINGER_SOFTWARE_mark">to</span></span> simplify deploying and using bundles<br />
2. <span id="43d27237-8d7d-420e-9a03-a280d8efdbb6" class="GINGER_SOFTWARE_mark"><span id="ed5890d1-6cc6-4fa5-a932-1b3fe918bea1" class="GINGER_SOFTWARE_mark">to</span></span> encourage independent bundle development.</p>
<p style="color:#000000;">OBR achieves the first goal by providing a service that can automatically install a bundle, with its deployment dependencies,<br />
<span id="cc8c595f-d84f-4be5-a9c3-1fc26b95e75d" class="GINGER_SOFTWARE_mark"><span id="64b3ebe2-4e5e-4be1-831e-3f96e92ca77f" class="GINGER_SOFTWARE_mark">from</span></span> a bundle repository. This makes it easier for people to experiment with existing bundles.</p>
<p style="color:#000000;">The second goal is achieved by raising the visibility of the available bundles in a repository.</p>
<p style="color:#000000;">OBR is an optional Apache Karaf feature. You have to install the <tt><span id="0f35ae84-338a-4031-a146-813a6e33674f" class="GINGER_SOFTWARE_mark"><span id="1e7ccab0-58b4-480e-bfcf-650f80bd4ffc" class="GINGER_SOFTWARE_mark">obr</span></span></tt> feature to use OBR service:</p>
<pre style="color:#000000;">karaf@root<span id="7910fd76-b2ae-4ad7-a270-90238d5a9b95" class="GINGER_SOFTWARE_mark"><span id="cc26d807-0ee1-48f6-aa14-7eada87a1735" class="GINGER_SOFTWARE_mark">(</span></span>)&gt; feature<span id="4e915ad7-c4ae-4278-b6d0-f64b31284997" class="GINGER_SOFTWARE_mark"><span id="14f210d3-879a-44eb-a22c-cc0197bf7885" class="GINGER_SOFTWARE_mark">:</span></span>install <span id="7f142775-649c-46ef-b269-ece21c32eefb" class="GINGER_SOFTWARE_mark"><span id="9418e87b-76cf-40db-b496-4fcbf6b81bdd" class="GINGER_SOFTWARE_mark">obr</span></span>
</pre>
<p style="color:#000000;">The OBR <span id="f4d8a930-b1a2-408e-89d9-1d673f3c0a24" class="GINGER_SOFTWARE_mark"><span id="85e490f2-2291-4086-aea4-3f7505d6dbd6" class="GINGER_SOFTWARE_mark">feature</span></span> turns Apache Karaf as an OBR client. It means that Apache Karaf can use <span id="3c94a8a4-0a85-497e-b099-26dfd934a3fc" class="GINGER_SOFTWARE_mark"><span id="d2c3a7c5-9e16-4349-93eb-c01ad7a3bab7" class="GINGER_SOFTWARE_mark">a</span></span> OBR repository to the installation<br />
<span id="8e3a5b73-fb3d-46da-a2f8-207f2a435fa3" class="GINGER_SOFTWARE_mark"><span id="46d7f117-1915-4919-9447-0370f00dd19e" class="GINGER_SOFTWARE_mark">of</span></span> the bundles, and during the installation of the features.</p>
<p style="color:#000000;">The installation of the <tt><span id="7fcc2217-1b23-480f-bf91-84fde6698983" class="GINGER_SOFTWARE_mark"><span id="7ae43cfb-aaf5-4b1c-80b4-1d0a3de0c2be" class="GINGER_SOFTWARE_mark">obr</span></span></tt> feature adds in Apache Karaf:</p>
<ul style="color:#000000;">
<li><span id="772deb00-fe8d-47fc-9278-fa417d8f145d" class="GINGER_SOFTWARE_mark"><span id="03721a53-148b-497e-8b4b-720f314d0e80" class="GINGER_SOFTWARE_mark">the</span></span> OBR service</li>
<li><span id="a00811ad-a939-43d9-9c6b-d911d0021f7c" class="GINGER_SOFTWARE_mark"><span id="2d89b13c-536f-4e3e-8041-e37675ad93bc" class="GINGER_SOFTWARE_mark">the</span></span> features OBR resolver</li>
<li><span id="7f9c4b62-133f-408a-89c1-7bf96ef23a9c" class="GINGER_SOFTWARE_mark"><span id="8e6fceb4-9edb-439f-bf6e-ed986bbe56e2" class="GINGER_SOFTWARE_mark">the</span></span> <tt><span id="1dc9a4df-bef1-4410-838a-51ab03f4e5b9" class="GINGER_SOFTWARE_mark"><span id="79fe43d0-f769-496a-9ba1-778c5f90478c" class="GINGER_SOFTWARE_mark">obr</span></span><span id="cef92830-5d24-4933-a7c5-1fb43c631b54" class="GINGER_SOFTWARE_mark"><span id="47412461-35e2-496b-b5d6-361feb3c1df6" class="GINGER_SOFTWARE_mark">:</span></span>*</tt> commands</li>
<li><span id="72da6e94-d40c-4016-a061-5aadb0e009cd" class="GINGER_SOFTWARE_mark"><span id="ee6bc4f1-1b06-4e94-a28a-8bfcbe212543" class="GINGER_SOFTWARE_mark">the</span></span> JMX ObrMBean</li>
</ul>
<p style="color:#000000;">The OBR repository contains all bundles. The OBR service knows all requirements and capabilities of each bundle on an<br />
OBR repository (it's the OBR metadata).</p>
<p style="color:#000000;">Thanks to that, when you install ("deploy" in OBR wording) a bundle using the OBR service, it looks for all bundles<br />
<span id="47a2adfe-452a-4044-a5b5-1b618a34403c" class="GINGER_SOFTWARE_mark"><span id="af1d8ed6-64cb-4f50-bc78-00fa35bf2a4b" class="GINGER_SOFTWARE_mark">providing</span></span> the capabilities matching the bundle requirements.<br />
It will automatically install the bundles needed for the bundle.</p>
<h2 id="OSGiframework">OSGi framework</h2>
<p>The <tt>system<span id="1ec1dcdb-b7bd-4048-8bfa-952e1764e22c" class="GINGER_SOFTWARE_mark"><span id="a40ee63a-2c02-40ac-8ce1-da4cf5e68b5d" class="GINGER_SOFTWARE_mark">:</span></span>framework</tt> command allows to display the current OSGi framework in use, and enable/disable debugging inside the OSGi framework.</p>
<pre>karaf@root<span id="329146b0-a225-4311-a724-ec5be8223ac6" class="GINGER_SOFTWARE_mark"><span id="2189402c-c881-4c61-8a41-fc5a73b156ac" class="GINGER_SOFTWARE_mark">(</span></span>)&gt; system<span id="b1f1c009-46a4-456c-b8f2-ba662cca46c7" class="GINGER_SOFTWARE_mark"><span id="7e49b8f6-d6b2-4f3c-9386-afc48aaed691" class="GINGER_SOFTWARE_mark">:</span></span>framework
Current OSGi framework is <span id="d7d2449c-4e29-4d23-89ba-8524d5035959" class="GINGER_SOFTWARE_mark"><span id="659c69d9-144a-40ab-bf90-d195bcd83888" class="GINGER_SOFTWARE_mark">felix</span></span>
karaf@root<span id="6734483b-fde6-41b2-92a0-e58a0fd8678d" class="GINGER_SOFTWARE_mark"><span id="9e9b143e-12ae-4822-8c89-1ca86a4bb925" class="GINGER_SOFTWARE_mark">(</span></span>)&gt; system<span id="978a8230-a8f2-411a-a095-57d145927973" class="GINGER_SOFTWARE_mark"><span id="e53b7cf8-273c-4f71-9027-27d32b0a5560" class="GINGER_SOFTWARE_mark">:</span></span>framework -debug
Enabling debug for <span id="ca590028-b9ef-4112-9624-48eb6bb123d7" class="GINGER_SOFTWARE_mark"><span id="842cea32-f8e9-4cf2-bedd-70759084ab17" class="GINGER_SOFTWARE_mark">OSGi framework</span></span> (<span id="ddd96100-ae39-4196-b5a7-b638abeafc23" class="GINGER_SOFTWARE_mark"><span id="74f99b44-bb94-4566-83e7-c6ce0e6d7b61" class="GINGER_SOFTWARE_mark">felix</span></span>)
karaf@root<span id="0d82deb6-5442-414c-8cb9-d7b2445b92e5" class="GINGER_SOFTWARE_mark"><span id="e94ea5d8-2f35-4a31-baa2-26274fcb8208" class="GINGER_SOFTWARE_mark">(</span></span>)&gt; system<span id="f6612c6b-9180-49da-af68-c377ba62b033" class="GINGER_SOFTWARE_mark"><span id="aa45ac33-6fe1-4b94-809e-6744e716c4fb" class="GINGER_SOFTWARE_mark">:</span></span>framework -<span id="5ce94d3c-c291-49a4-ade6-4bd77e49e56f" class="GINGER_SOFTWARE_mark"><span id="9f155396-6e01-496b-a0aa-777afbeed106" class="GINGER_SOFTWARE_mark">nodebug</span></span>
Disabling debug for <span id="9bbe4b30-8b37-4c1c-a641-d4cfa9828e8c" class="GINGER_SOFTWARE_mark"><span id="a8085c92-1582-4556-8eaa-ad8d5f2da0bf" class="GINGER_SOFTWARE_mark">OSGi framework</span></span> (<span id="bc360c67-7168-4031-a153-c7256ebe880c" class="GINGER_SOFTWARE_mark"><span id="8808f038-a5c1-4d8d-8805-211418d49b6a" class="GINGER_SOFTWARE_mark">felix</span></span>)

</pre>
<h2 id="Bundletree" style="color:#000000;">Bundle tree</h2>
<p style="color:#000000;">The <tt>bundle<span id="15fcc1c6-ea0b-436c-81f1-da30b74f5b9a" class="GINGER_SOFTWARE_mark"><span id="fcc37eb7-51b0-43a7-98bd-a1fbfee14b58" class="GINGER_SOFTWARE_mark">:</span></span>tree-show</tt> command shows the bundle dependency tree based on the wiring information of a given single bundle<br />
ID.</p>
<pre style="color:#000000;">karaf@root()&gt; bundle:tree-show 40
Bundle org.ops4j.pax.url.wrap [40] is currently ACTIVE

org.ops4j.pax.url.wrap [40]
+- org.ops4j.base.util.property [14]
+- org.ops4j.pax.url.commons [49]
|  +- org.ops4j.base.util.property [14]
|  +- org.ops4j.pax.logging.pax-logging-api [23]
|  +- org.ops4j.pax.swissbox.property [31]
|  |  +- org.ops4j.base.util.property [14]
|  |  +- org.ops4j.base.lang [41]
|  +- org.apache.felix.configadmin [43]
|  |  +- org.ops4j.pax.logging.pax-logging-api [23]
|  +- org.ops4j.base.lang [41]
+- org.ops4j.pax.logging.pax-logging-api [23]
+- org.ops4j.pax.swissbox.bnd [25]
|  +- biz.aQute.bndlib [30]
|  |  +- org.apache.servicemix.bundles.junit [36]
|  +- org.ops4j.pax.logging.pax-logging-api [23]
|  +- org.ops4j.base.lang [41]
+- org.apache.felix.configadmin [43]
+- org.ops4j.base.net [29]
|  +- org.ops4j.base.monitors [37]
|  +- org.ops4j.base.lang [41]
+- org.ops4j.base.lang [41]

</pre>
<p>Blueprint is an injection framework for OSGi. It allows you to declare beans in <span id="827a2346-5038-4c64-b5c5-9958c5ae71bd" class="GINGER_SOFTWARE_mark">a</span> XML file and contains <span id="ce530770-4345-4eb7-a5f6-09a0764e407f" class="GINGER_SOFTWARE_mark">specific statement</span> for OSGi services.</p>
<div class="page" title="Page 11">
<div class="section">
<div class="layoutArea">
<div class="column">
<p>Blueprint is the standardized version of Spring-DM</p>
</div>
</div>
</div>
</div>
