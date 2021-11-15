---
layout: page
title: RM2PT Tutorial
permalink: /tutorial/dev/create_rm2pt_nlp_project
typora-root-url: ../../../../rm2pt-website
---

# RM2PT NLP Project

###  Create RM2PT NLP Project in RM2PT

**In RM2PT, File -> New Project**

<img src="/imgs/RM2PTNLPProject/image-20211007155604601.png" alt="image-20211007155604601" style="zoom:50%;" />



**Type project name e.g., NL2OCL** 	

<img src="/imgs/RM2PTNLPProject/image-20211007160154353.png" alt="image-20211007160154353" style="zoom:50%;" />

**Click "Next >"**

<img src="/imgs/RM2PTNLPProject/image-20211007160216653.png" alt="image-20211007160216653" style="zoom:50%;" />

​	**Click "Finish "**

All the startup projects will be generated in project explorer as follows:

<img src="/imgs/RM2PTNLPProject/image-20211007163038561.png" alt="image-20211007163038561" style="zoom:50%;" />



Configuration Maven Library Step 1: add all required maven dependency

<img src="/imgs/RM2PTNLPProject/image-20211007161213598.png" alt="image-20211007161213598" style="zoom:50%;" />

Configuration Maven Library Step 2: download all required jars into folder *lib* by using maven goal *initialize*

<img src="/imgs/RM2PTNLPProject/image-20211007161325311.png" alt="image-20211007161325311" style="zoom:50%;" />

Refresh the project all the required jars are located in *lib* folder

<img src="/imgs/RM2PTNLPProject/image-20211007161451680.png" alt="image-20211007161451680" style="zoom:50%;" />

Configuration Maven Library Step 3: configure project dependency in RM2PT: *Right Click Project -> Build Path -> Configure Build Path -> Add JARS under Classpath* or add NLP jars as *User Library*

<img src="/imgs/RM2PTNLPProject/image-20211007161607690.png" alt="image-20211007161607690" style="zoom:50%;" />

<img src="/imgs/RM2PTNLPProject/image-20211007162736721.png" alt="image-20211007162736721" style="zoom:50%;" />

Configuration Maven Library Step 4: configure project dependency in NL2OCL Plugin: *Project / META-INF / MANIFEST.MF*

 <img src="/imgs/RM2PTNLPProject/image-20211007165501903.png" alt="image-20211007165501903" style="zoom:50%;" />

Then click *Runtime* Tab, Click *Add* 

<img src="/imgs/RM2PTNLPProject/image-20211007165520239.png" alt="image-20211007165520239" style="zoom:50%;" />

Add All required jars

<img src="/imgs/RM2PTNLPProject/image-20211007165619238.png" alt="image-20211007165619238" style="zoom:50%;" />



The runtime loading code template is located in *src-> package (ArtifactID) -> CoreNLP.xtend*

Note that code template is coded by [Xtend](https://www.eclipse.org/xtend/) language.

<img src="/imgs/RM2PTNLPProject/image-20211007162908869.png" alt="image-20211007162908869" style="zoom:50%;" />



The translation code template is located in *src-> package (ArtifactID) -> TranslateNL2OCL.xtend*

<img src="/imgs/RM2PTNLPProject/image-20211007163000684.png" alt="image-20211007163000684" style="zoom:50%;" />

## Test your generator project

<img src="/imgs/RM2PTGeneratorProject/image-20210119174458881.png" alt="image-20210119174458881" style="zoom:50%;" />

Double Click **Eclipse Application**

![image-20210119174536376](/imgs/RM2PTGeneratorProject/image-20210119174536376.png)

Click **Run** to open a new Eclipse IDE and then import the requirements model, and right click **.remodel** and choose *RM2PT-Dev / Loading StandNLP Runtime*

<img src="/imgs/RM2PTNLPProject/image-20211007163441150.png" alt="image-20211007163441150" style="zoom:50%;" />

Then choose *RM2PT-Dev / Translate Nature Language to OCL*

<img src="/imgs/RM2PTNLPProject/image-20211007163540624.png" alt="image-20211007163540624" style="zoom:50%;" />

### Package Code Generator Project through Maven

<img src="/imgs/RM2PTGeneratorProject/image-20210119182537487.png" alt="image-20210119182537487" style="zoom:50%;" />

set maven goal as: *clean package*

The Console will show the result as follows:

![image-20210119183048412](/imgs/RM2PTGeneratorProject/image-20210119183048412.png)

The finally code generator p2 updatesite is located in *xxx.updatesite/target*

you can distribute .zip to others to install your code generator



## Upload your source code to github with CI/CD support

## Create a project on Github

![image-20210119172748935](/imgs/RM2PTGeneratorProject/image-20210119172748935.png)

The default code generator project includes CI/CD script under *.github/workflow/CICD.yml*, you should add your *PUSH_Token* to *secerts* to make CI/CD work.

To your github 'setting / Developer settings / Personal access tokens', click *generate new token*. Note that you should select scope of **repo** and **workflow**

![image-20210119185556506](/imgs/RM2PTGeneratorProject/image-20210119185556506.png)

Then go back to your project, click *settings / Secrets*, and then paste the tokens with name **PUSH_TOKEN**

![image-20210119185735329](/imgs/RM2PTGeneratorProject/image-20210119185735329.png)

### Push your source code to Github Repo

<img src="/imgs/RM2PTGeneratorProject/image-20210119185832926.png" alt="image-20210119185832926" style="zoom:50%;" /><img src="/imgs/RM2PTGeneratorProject/image-20210119185859499.png" alt="image-20210119185859499" style="zoom:50%;" />

Click **Create Repository**

<img src="/imgs/RM2PTGeneratorProject/image-20210119185933235.png" alt="image-20210119185933235" style="zoom:50%;" />

![image-20210119190043832](/imgs/RM2PTGeneratorProject/image-20210119190043832.png)

Click **Commit and Push**

Note that you should configure your ssh key propertly if your use ssh way.

<img src="/imgs/RM2PTGeneratorProject/image-20210119190201887.png" alt="image-20210119190201887" style="zoom:50%;" />

<img src="/imgs/RM2PTGeneratorProject/image-20210119190220132.png" alt="image-20210119190220132" style="zoom:50%;" />

### Check CI/CD result

![image-20210119191246374](/imgs/RM2PTGeneratorProject/image-20210119191246374.png)

![image-20210119191304081](/imgs/RM2PTGeneratorProject/image-20210119191304081.png)

### Push to RM2PT Plugins Repo

send your application email to yilongyang@buaa.edu.cn, then RM2PT will create a repo for your, then you can push your source code to RM2PT repo.
