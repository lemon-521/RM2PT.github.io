---
layout: page
title: RM2PT Tutorial
permalink: /tutorial/user/create_new_project_from_text_model
typora-root-url: ../../../../rm2pt-website
---

## Create a RM2PT Project from sketch

RM2PT can be integreated into any eclipse project. This turorial shows how to create a requirements model and generate prototype in JavaFx project.

1. Open RM2PT, and create a `JavaFX project` through the wizard.  (Do not open JavaFX persepcitve)

2. Under the project, create a folder `requirementsmodel` and a new file `modelname.remodel` as textual requirements model, fill the following skeleton in `modelname.remodel`

```
UseCaseModel helloworld {

}
```
and then save it.

3. Right click the textual model `modelname.remodel` to create a graphic model `modelname.arid` through the wizard (`New`->`Other`->`Sirius`->`Represteantions File`. Note that selection `RequirementModel` is chosen on last step of `Viewpoints Selection`).

4. Add the required library (e.g [commons-lang](data/commons-lang3-3.8.1.jar)) to your project.

5. Modify the requirements model as your desired (at least `a use case diagram`, `system sequence diagram`, and `contracts of system operations`, and `a conceptual class diagram`) through `modelname-arid` or `modelname.remodel`.

6. Generate protoypes from `modelname.remodel`, all the code will be in folder `src-gen`.

7. Set genereate folder `src-gen` as source folder. Open `Prototype.fxgraph` to generate `Prototype.xml` if it is not exist.

8. Run the prototype and enjoy through `Main.java` under `gui` package,
