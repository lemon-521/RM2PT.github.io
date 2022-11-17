---
layout: page
title: RM2EIS
permalink: /advs/rm2eis
---

### Download and Installation

#### Need

RM2Doc is an advanced feature of **RM2PT**. We recommend you to use RM2Doc in RM2PT. If you don't have RM2PT, download [here](https://rm2pt.com/downloads/).

#### Installation

Open RM2PT, click on `Help` -> `Install New Software`

<img src="../../imgs/RM2Doc/image-20220507173100117.png" alt="image-20220507173100117" style="zoom: 70%;" />


Type `https://github.com/RM2PT/RM2EIS-UpdateSite` in the `Work with` field, select RM2EIS and click Next.

<img src="../../imgs/RM2EIS/example-1.png" alt="image-20220507173453144" style="zoom: 50%;" />

**If the update site does not work**, you can choose to install it offline. Click [here](https://github.com/RM2PT/RM2EIS-UpdateSite/archive/refs/tags/v1.3.zip) to download RM2EIS. Follow the steps below to install.

<img src="../../imgs/RM2Doc/image-20211017150545091.png" alt="image-20211017150545091" style="zoom: 50%;" />

<img src="../../imgs/RM2Doc/image-20211017150807041.png" alt="image-20211017150807041" style="zoom: 50%;" />

<img src="../../imgs/RM2Doc/image-20211017150921155.png" alt="image-20211017150921155" style="zoom: 50%;" />

<img src="../../imgs/RM2Doc/image-20211017150951456.png" alt="image-20211017150951456" style="zoom: 50%;" />

### Use of RM2EIS

#### Need

In order to run an EIS, you need to prepare a local kubernetes environment first. It is recommended to download [docker-desktop](https://www.docker.com/products/docker-desktop/) and open the k8s environment.
You may also need a readily available requirements model, where you can fetch at [case](https://github.com/LemonForeast/RM2EIS_CASE). Of course, you can do it yourself by following the [tutorial](https://rm2pt.com/tutorial/user/create_new_project).

#### Generate EIS

Take the CoCoME example as a demonstration, and import it into the workspace first.
Then, right click on `cocome.remodel` -> `RM2PT`-> ` Advance Features`-> ` Generate Springboot Application` and then make some configuration.


<img src="../../imgs/RM2EIS/example-2.png" alt="image-20220507174915467" style="zoom: 60%;" />

<img src="../../imgs/RM2EIS/example-3.png" alt="image-20220507174915467" style="zoom: 60%;" />

Wait until the EIS is generated.

#### Start EIS

Use the built-in startup configuration of eclipse. Or you can run `mvn clean package k8s:deploy` in the root directory.

<img src="../../imgs/RM2EIS/example-4.png" alt="image-20220507174915467" style="zoom: 60%;" />

<img src="../../imgs/RM2EIS/example-5.png" alt="image-20220507174915467" style="zoom: 60%;" />

<img src="../../imgs/RM2EIS/example-6.png" alt="image-20220507174915467" style="zoom: 60%;" />

Now you can inspect the demo through the panel or use the instrction `kubectl get pod`

<img src="../../imgs/RM2EIS/example-7.png" alt="image-20220507174915467" style="zoom: 60%;" />

#### Access the EIS

Open the api page and try yourself. You can get more information about how to use such page at [swagger](https://swagger.io/).

<img src="../../imgs/RM2EIS/example-8.png" alt="image-20220507174915467" style="zoom: 60%;" />

Or you may want to connect to the DB, just type your port, your username and your password as shown in figure.

<img src="../../imgs/RM2EIS/DB.png" alt="image-20220507174915467" style="zoom: 60%;" />

#### Stop EIS

Use the built-in startup configuration of eclipse. Or you can run `mvn k8s:undeploy` in the root directory.

<img src="../../imgs/RM2EIS/example-9.png" alt="image-20220507174915467" style="zoom: 60%;" />