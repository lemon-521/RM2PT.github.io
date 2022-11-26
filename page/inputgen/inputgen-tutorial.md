---
layout: page
title: InputGen
permalink: /advs/inputgen
---

### Download and Installation

#### Prerequest

InputGen is an advanced feature of **RM2PT**. We recommend you to use InputGen in RM2PT. If you don't have RM2PT, download [here](https://rm2pt.com/downloads/).

#### Installation of InputGen

Open RM2PT, click on `Help` -> `Install New Software`

<img src="../../imgs/InputGen/image-20220507173100117.png" alt="image-20220507173100117" style="zoom: 70%;" />



Type http://rm2pt.com/InputGen-UpdateSite in the Work with field, select RM2Doc and click Next.

<img src="../../imgs/InputGen/1online.png" alt="image-20220507173453144" style="zoom: 50%;" />

**If the update site does not work**, you can choose to install it offline. Click [here](https://github.com/RM2PT/InputGen-UpdateSite/releases/download/v1.0.0/com.rm2pt.generator.inputgen.updatesite-1.0.0-SNAPSHOT.zip) to download InputGen. Follow the steps below to install.

<img src="../../imgs/InputGen/2offline.png" alt="2offline" style="zoom: 50%;" />

<img src="../../imgs/InputGen/3load.png" alt="3load" style="zoom: 50%;" />

<img src="../../imgs/InputGen/4add.png" alt="4add" style="zoom: 50%;" />

<img src="../../imgs/InputGen/5next.png" alt="5next" style="zoom: 50%;" />


<img src="../../imgs/InputGen/6installanyway.png" alt="6installanyway" style="zoom: 50%;" />


### Use of InputGen 

#### Prerequest

In order to generate the prototype inputs, you need a requirement model, the **RM2PT project**. For creating or importing a RM2PT project，you can see the tutorial [here](https://rm2pt.com/tutorial/user/create_new_project). We recommend importing RM2PT projects from Git, which is avaliable at [CaseStudies](https://github.com/RM2PT/CaseStudies). The tutorial is [here](https://rm2pt.com/tutorial/user/import_rm2pt_project).

#### 1) Generate a prototype from the requirement model
After you import a requirements model, first, we use the RM2PT to generate a prototype from the requirements model by right click on `cocome.remodel` -> `RM2PT`-> `OO Prototype`-> ` Generate Desktop Prototype`

<img src="../../imgs/InputGen/10generateprototype.png" alt="10generateprototype" style="zoom: 50%;" />

#### 2) run the InputGen tool to refactor the prototype
after you generate a prototype, we use the InputGen to refactor the prototype from the requirements model by right click on `cocome.remodel` -> `RM2PT-dev`-> `InputGen`, and update the project.

<img src="../../imgs/InputGen/9refactor.png" alt="9refactor" style="zoom: 50%;" />

#### 3) The third step is to run the refactored prototype
Run the refactored prototype to validate the requirements by right click on `COCOMEPrototype` -> `pom.xml`-> `run`-> `maven build`
.


<img src="../../imgs/InputGen/8runprototype.png" alt="8runprototype" style="zoom: 50%;" />

#### 4) Importing the initial data
Before using the prototype to validate the requirements, we can use the Load File button to automatically load the initial data through the external interface, without manually adding it after modeling the administrator. We provide an external CoCoME yaml file, you can click [here](https://github.com/RM2PT/InputGen-UpdateSite/releases/download/v1.0.0/test.yaml) to download.

<img src="../../imgs/InputGen/11loadfile.png" alt="11loadfile" style="zoom: 50%;" />



#### 5) You can use the refactored prototype to validate the requirements.

#### For example
 In the sysytem operation enterItem, you can choose to click the LoadFromFile button to generate input data, if you think that the input data does not meet your requirements, you can also click the input box to choose other candidates. Moreover, you can click the InputReset button to reset all inputs and manually input them by yourself.

<img src="../../imgs/InputGen/7enterItem.png" alt="7enterItem" style="zoom: 50%;" />


