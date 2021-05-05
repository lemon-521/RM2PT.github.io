---
layout: page
title: RM2PT Tutorial
permalink: /tutorial/user/import_rm2pt_project
typora-root-url: ../../../../rm2pt-website
---

## Import RM2PT project from Git

We provides serval RM2PT projects on Github: https://github.com/RM2PT/CaseStudies, you can import them into local by

Right click `Model Explorer` -> `Import`

![Alt text](/imgs/import1.png)

Choose `Projects from Git`

![Alt text](/imgs/import2.png)

Choose `Clone URI`

![Alt text](/imgs/import3.png)

Type Git URL -> `Next`

![Alt text](/imgs/import4.png)

Choose `Master`

![Alt text](/imgs/import5.png)

Choose the case studies -> `Finish`

![Alt text](/imgs/import6.png)


### Import from directory or zip file

RM2PT project can also be imported from local directory or zip file

Right click `Model Explorer` -> `Import`

![Alt text](/imgs/import1.png)

Choose `Existing Projects into Workspace`

![Alt text](/imgs/import22.png)

Choose `select root directory` or `Select archieve file`

![Alt text](/imgs/import23.png)

### Requirements Modeling

Open to project `net.mydreamy.casestudies.atm.autogui`, Requirement model is under in directory *requirementmodel*:

* `atm.aird` is graphic requirements model
* `atm.remodel` is text requirements model

Double click `atm.arid` to open use case diagram by default, other diagram in `atm.arid` / `Represteantions per category` / `RequriementModel`

### Prototype Generation

Right click on `cocome.remodel`, use `RM2PT` -> `Generate Object-oriend Prototype`, the code of prototpye will generated under the folder of `src-gen`.

![Alt text](/imgs/import-generate-prototype.png)

### Requirements Validation

* Run prototype by `src-gen -> gui -> Main.java`, then you can use the generated prototype to validate the requirements (Note that `Main.java` requires `Prototype.fxml` file, it will be automatically generated from `Prototype.fxgraph`).

![Alt text](/imgs/prototype-main.png)


* We also prepare JavaFX GUI test script for you demonstrate the validate procedure by running `src/test/java -> gui -> MainTest.java -> integrationTest()`, then watch automated executions on the prototype.

![Alt text](/imgs/prototype-execution-by-eclipse.png)

* We also support testing by Maven, right click on `pom.xml` -> `Run` -> `Maven build...`
![Alt text](/imgs/prototype-execution-by-maven.png)


Please note you need setting RM2PT to control your computer before running the integration testing script. [Detail setting](disgatekeeper)
