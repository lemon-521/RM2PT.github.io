---
layout: page
title: OCL2NL
permalink: /advs/ocl2nl/
---


##  Introduction

**OCL2NL is a tool**  for automatic generation of **natural language** from the **OCL contracts**.

 The **benefits** of **OCL2NL** are as follows:

1. since the text is generated from a formal contract, it is the natural language text that is also formal in a sense, avoiding ambiguity and under-specification.
2. if a formal contract changes, a new natural language text can be generated directly, avoiding the problem of synchronizing formal and informal specifications.
3. the natural language text produced can be used as part of the documentation of systems.

## OCL2NL Installation

### Prerequest

**OCL2NL** is an advanced feature of **RM2PT**. We recommend you to use OCL2NL as a part of RM2Doc, which is a feature of RM2PT. If you don't have RM2PT, download [here](https://rm2pt.com/downloads/).

### Online Installation

Open RM2PT, click on `Help` -> `Install New Software`

<img src="../../imgs/RM2Doc/image-20220507173100117.png" alt="image-20220507173100117" style="zoom: 70%;" />



Type http://rm2pt.com/RM2Doc-UpdateSite in the Work with field, select RM2Doc and click Next.

<img src="../../imgs/RM2Doc/image-20220507173453144.png" alt="image-20220507173453144" style="zoom: 50%;" />

### Offline Installation

**If the update site does not work**, you can choose to install it offline. Click [here](https://github.com/RM2PT/RM2Doc-UpdateSite/releases/download/v1.0.0/com.rm2pt.generator.rm2doc.updatesite-1.0.0-SNAPSHOT.zip) to download RM2Doc. Follow the steps below to install.

<img src="../../imgs/RM2Doc/image-20211017150545091.png" alt="image-20211017150545091" style="zoom: 50%;" />

<img src="../../imgs/RM2Doc/image-20211017150807041.png" alt="image-20211017150807041" style="zoom: 50%;" />

<img src="../../imgs/RM2Doc/image-20211017150921155.png" alt="image-20211017150921155" style="zoom: 50%;" />

<img src="../../imgs/RM2Doc/image-20211017150951456.png" alt="image-20211017150951456" style="zoom: 50%;" />

## OCL2NL Tutorial

### Prerequest

In order to generate natural language descriptions for OCL contracts, you need a requirements model and OCL contracts, the **RM2PT project**. For creating or importing a RM2PT project，you can see the tutorial [here](https://rm2pt.com/tutorial/user/create_new_project).

### Input of OCL2NL — Requirements Model

<img src="../../imgs/RM2Doc/rm.png" alt="rm" style="zoom: 50%;" />

The input to OCL2NL is a UML requirements model with OCL constraints. The model includes: a use case diagram, system sequence diagrams, contracts of and system operations.

- **A conceptual class diagram:** A conceptual class diagram is a concept-relation model, which illustrates abstract and meaningful concepts and their relations in the problem domain, in which the concepts are specified as classes, the relations of the concepts are specified as the associations between the classes, and the properties of the concepts are specified as the attributes of the classes.
- **A use case diagram:** A use case diagram captures domain processes as use cases in terms of interactions between the system and its users. It contains a set of use cases for a system, actors represented a type of users of the system or external systems that the system interacts with, the relations between the actors and these use cases, and relations among use cases.
- **System sequence diagrams:** A system sequence diagram describes a particular domain process of a use case. It contains the actors that interact with the system, the system and the system events that the actors generate, their order, and inter-system events. Compared with the sequence diagram in design models, a system sequence diagram treats all systems as a black box and contains system events across the system boundary between actors and systems without object lifelines and internal interactions between objects.
- **Contracts of system operations:** The contract of a system operation specifies the conditions that the state of the system is assumed to satisfy before the execution of the system operation, called the pre-condition and the conditions that the system state is required to satisfy after the execution (if it terminated), called the post-condition of the system operation. Typically, the pre-condition specifies the properties of the system state that need to be checked when system operation is to be executed, and the postcondition defines the possible changes that the execution of the system operation is to realize.

### Generate NL Contract

After you add a requirements model, you can generate NL contracts for OCL contracts by right click on `cocome.remodel` -> `RM2PT`-> ` Advance Features`-> ` Generate NL Contract`

<img src="../../imgs/RM2Doc/image-20220507174915467.png" alt="image-20220507174915467" style="zoom: 60%;" />

Refresh your remodel file to see the generated NL contracts

<img src="../../imgs/RM2Doc/1691751188251.png" alt="image-202308111912" style="zoom: 60%;" />