---
layout: page
title: RM2PT Tutorial
permalink: /tutorial/dev/create_rm2pt_dsml_project/
typora-root-url: ../../../../rm2pt-website
---

# RM2PT Domain-Specific Modeling Language(DSML) Project

### Create DSML Project in RM2PT

**In RM2PT, File -> New Project**

![image-20221017153814389](/imgs/RM2PTDSMLProject/image-20221017153814389.png)

**Type project name e.g. com.rm2pt.basicfamily**

![image-20221017154509677](/imgs/RM2PTDSMLProject/image-20221017154509677.png)

**Click "Next >", and change the metamodel name as needed**

![image-20221017154842760](/imgs/RM2PTDSMLProject/image-20221017154842760.png)

**Click "Finish"**

All the startup projects will be generated in project explorer as follows:

![image-20221017155346183](/imgs/RM2PTDSMLProject/image-20221017155346183.png)

The Ecore editor and the odesign editor will be opened automatically. 

### Create your domain model and configure the odesign

To create domain model, refer to [Sirius/Tutorials/DomainModelTutorial - Eclipsepedia](https://wiki.eclipse.org/Sirius/Tutorials/DomainModelTutorial)

You need to read following sections:

- Create the elements of the metamodel
- Generate the source code of the Metamodel

To configure the odesign, refer to [Sirius/Tutorials/StarterTutorial - Eclipsepedia](https://wiki.eclipse.org/Sirius/Tutorials/StarterTutorial)

You need to read "Define Diagram" and its following sections.

### Package DSML Project through Maven

![image-20221017161845535](/imgs/RM2PTDSMLProject/image-20221017161845535.png)

**Click Run**

![image-20221017162050444](/imgs/RM2PTDSMLProject/image-20221017162050444.png)

The Console will show the result as follows:

![image-20221017162323214](/imgs/RM2PTDSMLProject/image-20221017162323214.png)

The finally graphic modeling p2 updatesite is located in **xxx.updatesite/target**

You can distribute .zip to others to install your graphic modeling tool

### Test Your Plugin

**Install your plugin in RM2PT**

![image-20221017162959330](/imgs/RM2PTDSMLProject/image-20221017162959330.png)

![image-20221017163040982](/imgs/RM2PTDSMLProject/image-20221017163040982.png)

**Click "Add..." and then "Archive..." and choose the .zip generated before**

![image-20221017163212627](/imgs/RM2PTDSMLProject/image-20221017163212627.png)

**Click ”Add“**

![image-20221017163238314](/imgs/RM2PTDSMLProject/image-20221017163238314.png)

**Click ”Next > " and then Finish**

When the plugin has been installed, you can create instance of Basicfamily Model. 

![image-20221017164349321](/imgs/RM2PTDSMLProject/image-20221017164349321.png)

Also you can add a representation for your instance.

![image-20221017164742166](/imgs/RM2PTDSMLProject/image-20221017164742166.png)
