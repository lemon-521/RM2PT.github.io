---
layout: page
title: Requirements Validation through Auto-Prototying
permalink: /tutorial/user/validate_through_prototype
typora-root-url: ../../../../rm2pt-website
---


# Validation through Auto-Prototying
After creating a requirement model and ocl contract，we can generate a prototype from them. Then we can validate requirements by running a prototype system.
**Step 1** : Generate prototype from requirement model
The requirement model and ocl contract are stored in remodel file. right-click remodel file -> RM2PT -> OO Prototype -> Generate Desktop Prototype.
You will see a prototype project generated at the same level as original project.
![](/imgs/validate_through_prototype/Pasted%20image%2020220617160617.png)
**Step 2** : Run the generated Prototype
Right click the pom.xml file in prototype project, run as - > Run configurations. (It doesn't matter where you open the run configuration from, because the run path is specified later)
![](/imgs/validate_through_prototype/Pasted%20image%2020220617161245.png)
Double click Maven Build tab, it will create a new configuration. Open the New_configuration, change the Base directory to the prototype project path, enter `exec:java` in Goals. Finally click the run button, the prototype interface will be displayed after compiling.
![](/imgs/validate_through_prototype/Pasted%20image%2020220617161902.png)
**Step 3** : Validate requirement
There are two tabs in prototype program: System Function and System State.
On the left side of the System Function tab there are actors with use cases and operations you have defined in requirement model.
There are input and output of operations and System log in the middle of the program.
Under the System log, there are Execute button and reset button of the operation.
On the right side, there are definitions of the operation which define variable value, Preconditions and Postconditions of the operation which show grean if pass, show red if fail,related Invariants which show grean if pass, show red if fail.
![](/imgs/validate_through_prototype/Pasted%20image%2020220617163011.png)
The System State tab shows the state of classes you defined in the Conceptual Class Diagram. And it also shows all Invariants  in remodel.
![](/imgs/validate_through_prototype/Pasted%20image%2020220617163841.png)
**Step 4** : Repair requirement model
If the behavior of the prototype system is inconsistent with the needs of stakeholders, you can find the problem by observing the error message on the interface.
In this example, customer using $100 to buy $100 item , cashier should give the customer $0 balance, but the invariant turn red.
![](/imgs/validate_through_prototype/Pasted%20image%2020220618212615.png)
Find the corresponding invariant constraint in remodel file, the constraint should be right if balance = 0, fix it and generate the prototype again.
![](/imgs/validate_through_prototype/Pasted%20image%2020220618212731.png)
