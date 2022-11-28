---
layout: page
title: RM2EIS
permalink: /advs/rm2eis
---

## Introduction

A demo video can be found as follows:

<iframe class="uk-width-1-3@m" width="560" height="315" src="https://youtu.be/M8m14bCdc-o" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>RM2DM Youtube Video</iframe>


**RM2EIS** is a tool for automatic generation of an **EIS** from a **requirements model**. The **benefits** are as follows:

- It proves consistent quality
- No understanding bias based on validated demand generation
- One-click generation does not bring extra time and cost
- Prevent loopholes caused by poor manual consideration


<img src="../../imgs/RM2EIS/RM2EIS.png" style="zoom: 100%;" />


### Input of RM2EIS — Requirements Model

<img src="../../imgs/RM2Doc/rm.png" alt="rm" style="zoom: 50%;" />


The input to RM2Doc is a UML requirements model with OCL constraints. The model includes: , a use case diagram, system sequence diagrams, contracts of and system operations.


- **A conceptual class diagram:** A conceptual class diagram is a concept-relation model, which illustrates abstract and meaningful concepts and their relations in the problem domain, in which the concepts are specified as classes, the relations of the concepts are specified as the associations between the classes, and the properties of the concepts are specified as the attributes of the classes.



- **A use case diagram:** A use case diagram captures domain processes as use cases in terms of interactions between the system and its users. It contains a set of use cases for a system, actors represented a type of users of the system or external systems that the system interacts with, the relations between the actors and these use cases, and relations among use cases.



- **System sequence diagrams:** A system sequence diagram describes a particular domain process of a use case. It contains the actors that interact with the system, the system and the system events that the actors generate, their order, and inter-system events. Compared with the sequence diagram in design models, a system sequence diagram treats all systems as a black box and contains system events across the system boundary between actors and systems without object lifelines and internal interactions between objects.

- **Contracts of system operations:** The contract of a system operation specifies the conditions that the state of the system is assumed to satisfy before the execution of the system operation, called the pre-condition and the conditions that the system state is required to satisfy after the execution (if it terminated), called the post-condition of the system operation. Typically, the pre-condition specifies the properties of the system state that need to be checked when system operation is to be executed, and the postcondition defines the possible changes that the execution of the system operation is to realize.



### Output of RM2EIS — EIS

**EIS**(Enterprise Information System) integrates business logic, improving business productivity and shortening service, product development, and marketing life cycles.

EIS is important in industrial and commercial domain, but it can only be formally put into use after developement, which is time-consuming, laborious, and error-prone.

**Layer structure** is common in EIS, where:

- **Controller** layer responsible for mapping requests to corresponding service handlers
- **Service** layer responsible for the processing of business logic
- **Repository** layer provides data access operations and provides caching processing
- **Entity** layer maps entity classes to tables in the database

<img src="../../imgs/RM2EIS/overview.png" style="zoom: 100%;" />



## Features

### Overview
RM2EIS takes the requirement model as input and uses a transformation algorithm to process and parse the user requirement information contained in the requirement model. For the OCL expressions contained in the system operation contract, RM2EIS needs transformation rule to transform them into the system operation code that drives the running of the EIS. Finally, the method outputs a complete and executable
EIS, which can be further deployed in K8S.



#### SpringBoot-based EIS Generation
**Mapping OO operations to CRUD:**
For EIS, CRUD is the most basic operation, so RM2EIS improves OO methods as shown.

<img src="../../imgs/RM2EIS/map.png" style="zoom: 100%;" />

**Following the Restful style:** 

RESTFUL is a design style for web applications based on HTTP and can be defined using JSON format, which is suitable for EIS scenarios. In a RESTful web service, each resource has an address. The resource is the target of the method call, and the method list is the same for all resources.

**Generating from Requirements Model:** 

Most of the work is based on a more detailed design model. RM2EIS is generated from a requirements model that contains only external information and no internal information. The template
generation method is used, which includes design patterns, development experience, and industry standards. 



#### K8S Auto Deployment

To facilitate users, RM2EIS can generate supporting deployment scripts, including code packaging and containerization, service orchestration, and environment initialization. Users can configure the service information to generate corresponding scripts. In addition to deploying the EIS locally, RM2EIS supports one-click cloud migration With the help of the jkube2 plug-in by integrating the deployment into the maven phase. With containerized management, EIS can easily implement elastic services, error tracing and other features. The cloud service is unaware of Restful interfaces exposed to the outside. Accordingly, RM2EIS also provides a cease-of-deployment instruction.

## How to use RM2EIS

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