---
layout: post
title: Dockerfile and Compose.yaml
date: 2018-01-26 14:43:17.000000000 +08:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: [Cloud, Docker]
tags:
- compose
- docker
meta:
  _edit_last: '1'
  _yoast_wpseo_content_score: '60'
  _yoast_wpseo_primary_category: '13'
  _oembed_7188247c40fa5c9c84830eca2c1cba12: '<blockquote class="wp-embedded-content"
    data-secret="yatF3JNsHq"><a href="http://daas.mydreamy.net/?p=83237">Dockerfile
    and Compose.yaml</a></blockquote><iframe class="wp-embedded-content" sandbox="allow-scripts"
    security="restricted" style="position: absolute; clip: rect(1px, 1px, 1px, 1px);"
    src="http://daas.mydreamy.net/?p=83237&#038;embed=true#?secret=yatF3JNsHq" data-secret="yatF3JNsHq"
    width="600" height="338" title="&#8220;Dockerfile and Compose.yaml&#8221; &#8212;
    MCloud DaaS" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>'
  _oembed_time_7188247c40fa5c9c84830eca2c1cba12: '1516977957'
author:
  login: yylhome
  email: yylonly@gmail.com
  display_name: yylhome
  first_name: ''
  last_name: ''
---
<h1>Dockerfile</h1>
<p>Docker-file describes two stages</p>
<ul>
<li>how to build a images (Focus on build the runtime)</li>
</ul>
<p>FROM :  base-images</p>
<p>ENV,  ADD/COPY, RUN</p>
<ul>
<li>how to start up a container (Focus on deploy, run the services)</li>
</ul>
<p>EXEC["command", "parameters", ....]  (run bash default)</p>
<p>ENTRYPOINT["/xxx.sh"]</p>
<h4>Build the Image from Dockerfile</h4>
<p>docker build . -t xxxx</p>
<h4>Run Container from images</h4>
<p>docker run --name container_name -p localport:containerport -v /localpath:/containerpath --envs XXX=XXX -itd imagename</p>
<p>when you exit from container, the container will be stopped.</p>
<p>but you can start and attach to it.</p>
<ul>
<li>docker ps -a (find the container name)</li>
<li>docker start container_name</li>
<li>docker attach container_name</li>
</ul>
<p>However, container often start a service in bash, it blocks you input other commands. Therefore, you can execute another bash to execute commands.</p>
<ul>
<li>docker exec -it container_name commands</li>
<li>e.g. docker exec -it container_name bash</li>
</ul>
<p>The container can depend each other by --link, it will add the depended container name into the /etc/hosts, then you can use hostname to assign an container to another without expose port to hosts. The docker compose make it more convenient.</p>
<h1>Compose.yaml</h1>
<p>Compose can help your run multiple docker container at the same times. all the parameters can be store in compose.yaml. E.g.</p>
<p>=================================<br />
version: '3'</p>
<p>services:</p>
<p>glassfish:</p>
<p>build: .</p>
<p>ports:</p>
<p>- 8080:8080</p>
<p>- 4848:4848</p>
<p>depends_on:</p>
<p>- mysql</p>
<p>mysql:</p>
<p>build: ./DB</p>
<p>environment:</p>
<p>MYSQL_ROOT_PASSWORD: 123456</p>
<p>MYSQL_DATABASE: ehr</p>
<p>MYSQL_USER: ehr</p>
<p>MYSQL_PASSWORD: ehr</p>
<p>MYSQL_ROOT_HOST: '%'</p>
<p>=====================================</p>
<p>-p =&gt; ports:</p>
<p>--envs =&gt; environment:</p>
<p>--link =&gt; depends_on:</p>
<p>docker build =&gt; build:</p>
<h4>Build Images and Run Container:</h4>
<ul>
<li>docker-compose build</li>
<li>docker-compose up</li>
<li>docker-compose down</li>
</ul>
<p>&nbsp;</p>
