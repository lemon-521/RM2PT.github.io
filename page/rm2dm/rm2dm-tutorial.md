---
layout: page
title: RM2DM
permalink: /advs/rm2dm
---

### Download and Installation

#### Prerequest

RM2DM is an advanced feature of **RM2PT**. We recommend you to use RM2DM in RM2PT. If you don't have RM2PT, download [here](https://rm2pt.com/downloads/).

#### Installation of RM2DM

Open RM2PT, click on `Help` -> `Install New Software`

<img src="../../imgs/RM2DM/InstallNewSoftware.png" alt="InstallNewSoftware" style="zoom: 80%;" />



Type http://rm2pt.com/RM2DM-UpdateSite in the Work with field, select DesignModelGenerator and click Next.

<img src="../../imgs/RM2DM/updatesite.png" alt="updatesite" style="zoom: 80%;" />

**If the update site does not work**, you can choose to install it offline. Click [here](https://github.com/RM2PT/RM2DM-UpdateSite/releases/download/v1.0.0/com.rm2pt.generator.design.updatesite-1.0.0-SNAPSHOT.zip) to download RM2DM. Follow the steps below to install.

<img src="../../imgs/RM2DM/local1.png" alt="local1" style="zoom: 80%;" />

<img src="../../imgs/RM2DM/local2.png" alt="local2" style="zoom: 80%;" />

<img src="../../imgs/RM2DM/local3.png" alt="local3" style="zoom: 80%;" />

<img src="../../imgs/RM2DM/local4.png" alt="local4" style="zoom: 80%;" />

### Use of RM2DM 

#### Prerequest

In order to generate the documentation, you need a requirements model, the **RM2PT project**. For creating or importing a RM2PT project，you can see the tutorial [here](https://rm2pt.com/tutorial/user/create_new_project). We recommend importing RM2PT projects from Git, which is avaliable at [CaseStudies](https://github.com/RM2PT/CaseStudies). The tutorial is [here](https://rm2pt.com/tutorial/user/import_rm2pt_project).

#### Generate Design Model

Here we use CoCoME as an example.

After you import CoCoME requirements model from Git, you can generate the design model from the requirements model by right click on `cocome.remodel` -> `RM2PT-Dev`-> `Generate Design Model`


<img src="../../imgs/RM2DM/GenerateDesignModel.png" alt="GenerateDesignModel" style="zoom: 80%;" />

The generated design model is in the DesignModel folder

<img src="../../imgs/RM2DM/GenerateResult.png" alt="GenerateResult" style="zoom: 80%;" />

##### Generated Class Diagram(After adjusting layout)
<img src="../../imgs/RM2DM/ClassDiagram.png" alt="ClassDiagram" style="zoom: 100%;" />

##### Generated Sequence Diagram 
<img src="../../imgs/RM2DM/SequenceDiagram.png" alt="doc" style="zoom: 60%;" />


