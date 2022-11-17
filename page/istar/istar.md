---
layout: page
title: Goal2UCM
permalink: /istar/
---

## Goal2UCM
### iStar Metamodels
In istar2.0, Actor is divided into two types: role- the abstract description of the behavior of social Actors in a specific environment or field. Agent- an Actor with concrete entity representation.

Actors are often interrelated. In ISTAR 2.0, two different types of connections are defined.
Is-a: represents the concept of generalization / specialization in ISTAR 2.0. Only Role can be specialized as Role, or general Actor specialized as general Actor.
Participants-in: represents any type of association between two Actors, not generalization / specialization. This association is not limited by the type of Actor.

The target elements are elements required by the Actor. Therefore, they have different types and are the core of ISTAR 2.0. Connected with an Actor in the aggregate relation “wants”, it indicates what the Actor wants. In this section, we will explain four types of target elements:
Goal: the state that Actor wants to achieve, and there is clear achievement standard.
Quality: the attribute that Actor wants to achieve to some extent.
Task: refers to the action that Actor wants to implement, usually to achieve a goal.
Resource: the physical entity or information entity that the Actor needs to execute a task.

Dependency is the dependency relationship between an actor and intentional elements. This section describes the relationship between these five parameters. However, the Depender and Dependee in a dependency relationship should not be the same actor:
Depender: An Actor that depends on a certain “dependum” to provided.
Dependermt: it is the target element in “depender”, which explains the reason for the existence of dependency.
Dependee: it is an Actor that should provide “dependum”.
Dependeelmt: it is the target element in “dependee”, which explains how the “dependee” Intends to provide the dependency.
Dependeelmt: it is the target element as a dependency object.

Refinement relationship links Goal and Task hierarchically. Refinement is an n-element relationship that associates a parent object with one or more child objects. The target element can only be the parent element in at most one optimization relationship. And: represents the logical AND relationship, with at least two or more child elements. Or: represents the logical OR relationship and has at least one child element.

Contribution represents the impact of the Intentional Elements on quality. Quality itself cannot provide a contribution.
Make: the source provides sufficient positive evidence for the satisfaction of the target.
Help: the source provides weak positive evidence for the satisfaction of the target.
Hunt: the evidence provided by the source is insufficient to prove that the target is satisfied (or denied).
Break: the source provides sufficient evidence to prove that the target is satisfied (or denied).

Qualification relationship can associate quality with other target elements (task, goal, or qesource). It can limit other target elements.

Neededby relationship links a task to a qesource, indicating that participants need resources to perform the task.


**iStar Metamodel：**
![image](https://user-images.githubusercontent.com/49606429/134271842-f02e85a4-03e3-4dfb-b02f-40bc453e1c97.png)

### UML Metamodels

In this article, we will mainly use the UseCasaModel part to explain. The UseCaseModel is also divided into two parts. The first part is the use case diagram. The main elements here are Actor and UseCase. These two elements are connected by uc to obtain the basic use case diagram. The second part is the system sequence diagram. This part is mainly composed of Interaction and some elements that have an aggregation relationship with it. They are Message, Execution, and Combined Fragment respectively. They describe when a use case enters the system sequence diagram, the beginning of each Task, the end, and the cycle and selection process that may exist in between.
**UML Metamodels：**
![image](https://user-images.githubusercontent.com/49606429/134272278-dcad3589-70a4-4571-93fc-60906389dae2.png)


## Transformation Rules

This section mainly explains how to map the target model to UML. We propose the following conversion rules. The correctness of the transformation rules is based on the semantic description of the target model and UML standard documents.

### Use Case Diagram
When transforming the use case diagram, the whole transformation process will be divided into two parts. The first part is the conversion of Actor, and the second part is the conversion of usecase.

#### Actor conversion
In UML, an Actor is an external entity that interacts with the system. It can be a user, an external system that can interact with the system, or a basic device. In the Goal Model, Actors are divided into two categories, Role and Agent. Agent is a specific instance, such as a person, organization, or department. It is not suitable to convert Agent to Actor in UML because Agent is more specific and has more limitations. Role is an abstract description of a certain group of people, such as students. It is closer to the meaning of Actor in UML, so it can be converted directly.

**The rule R1 describes the process of transforming role in Goal model into Actor in UML:**

![image](https://user-images.githubusercontent.com/49606429/135037184-5de23ffd-202a-4ea0-9335-ea5b58de3078.png)

**Transforming Role in Goal model into Acter in UML：**
![image](https://user-images.githubusercontent.com/49606429/133743714-2ccc88b2-793b-4b15-bf58-897f244ca6d0.png)

#### Use Case conversion
The Use Case in UML describes the behavior of the system from the user's point of view. It describes the function of the system as a series of events, and finally provides valuable observations for the operator. In the Goal Model, a Goal is the state that the Actor wants to achieve, and there is a clear completion standard. They all describe behavior or state from the perspective of Actor, so they can be transformed. However, not all goals can be converted to Use Cases, only goals at the root can be converted. At present, we do not consider the situation when Goal is connected to another Goal through Refinement. This problem will be improved in the follow-up work.

**Formula R2 describes the process of transforming Goal in Goal Model into UC in UML:**

![image](https://user-images.githubusercontent.com/49606429/135037323-d25cc373-9a83-418b-ab65-ce185339bb26.png)


**Transforming Goal in Goal model into UC in UML：**
![image](https://user-images.githubusercontent.com/49606429/133743923-f9c1f0ce-7ba6-447e-8ad0-6844e39f4154.png)

### System Sequence Diagram
When converting the System Sequence diagram, because the Use Case sequence diagram is relatively large, we need to divide the entire conversion process into two parts. The first part is the conversion of system operations, and the second part is the conversion of system services.

#### System Operation Conversion
The Task in a Goal Model represents an action that the Actor wants to perform, usually to reach a certain Goal. The ‘Interaction’ part of UML is mainly composed of the following elements: ‘Message’, ‘Execution’ and ‘AbstractEnd’. All of these elements may be involved to complete a single task in the entire Use Case sequence diagram. They describe the process of the same task. So, we can convert the Task to the entire ‘Interaction’, but if the Task is connected by multiple other Intentional Elements with ‘OrRefinement’, it will not be converted in any way.

**The rules R3 and R4 describe the process of transforming Task in Goal Model into child elements CallMessage and ReturnMessage of message in UML:**

![image](https://user-images.githubusercontent.com/49606429/135037989-3e5231b2-3f8d-4043-9669-b20d0ccfed2a.png)
![image](https://user-images.githubusercontent.com/49606429/135038006-af2d7e68-9aa6-452c-bf2d-f52af38da60c.png)


**Transforming Task in Goal model into Interaction in UML：**
![image](https://user-images.githubusercontent.com/49606429/133744643-2417777f-eb05-46b8-945c-7e767d78a5d2.png)

#### System Service Conversion
UML system service consists of the following elements: Operation and Parameter. If this part needs to be transformed, then the two elements in Goal model, Task and Resource, will also be transformed simultaneously. Task is transformed into Operation, however, if the Task is connected by multiple other Intentional Elements with ‘OrRefinement’, it will not be transformed. The physical entity or information entity that the resource participant needs to perform the task should be transformed into a parameter, so as to form a complete system service part.

**The rule R5 describes the process of transforming Parameter in Goal Model into Operation in UML:**
![image](https://user-images.githubusercontent.com/49606429/135038130-5857a12d-f937-41af-aee0-b63481736ba1.png)

**The rule R6 describes the process of transforming Resource in Goal Model into Parameter in UML:**
![image](https://user-images.githubusercontent.com/49606429/135038479-b967bf28-fb9e-44e6-9c65-007e4b00cb09.png)


**Transforming Task and Resource in Goal model into Service and Operation in UML：**
![image](https://user-images.githubusercontent.com/49606429/133744670-7bc9328d-77ec-49b3-8780-ca13d2b493bc.png)



## case study
  We will take the process of interaction between cashiers and customers in CoCoME (supermarket shopping system) in the RM2PT case as the case of this experiment. The description of this process is mainly as follows:


**Goal model of supermarket shopping system：**
![image](https://user-images.githubusercontent.com/49606429/133736737-e695f7a0-3936-45e3-b937-f17b5be7ffe7.png)

  First, cashier can perform three actions: OpenCashDesk, CloseCashDesk and processSale. This part constitutes a simple use case diagram. The ‘processSale’ action, can be expanded  to get the system sequence diagram. This part mainly reflects the interaction with customers. First, makeNewSale is initiated and then the enterItem loop is initiated, requiring the customers to provide the cashier with barcode and quantity information about the goods until it ends. then we proceed to the next action, endSale. Finally, a selection to either MakeCashPayment or MakeCardPayment is needed. If cash payment is chosen, a specific amount is required. If on the other hand card payment chosen, the card account number, expiry date and fee is required. The last part is the domain model, which mainly preserves the entity data of the above process. The stored data include ‘cashDesk’, cashier, payment, ‘cashPayment’, ‘cardPayment’, item and ‘salesLineItem’.

  According to the above conditions, we need to create the corresponding Goal model. First, create a cashier of role type with three goals: openCashDesk, closeCashDesk and processSale. Set them to goal. In order to achieve the goal of ‘processSale’, we need to do the following four tasks. The first task is to make a new sale, set it as a task element, and connect it with ‘processSale’ through ‘AndRefinement’, so that this task belongs to the above goal, and then connect it to the next ‘Task’ through ‘previousTask’, so that the order between tasks can be obtained. The second task is the ‘enterItem’. In addition to the above operations, because this is a loop in a special task, its two properties ‘isCombinedFragment’ and ‘isLoop’ should be set to true. In this way, the task will have the loop property during conversion. The third task is ‘endSale’, which is a common task. It only needs to do the same operation as the first task. The last task, payment is also a special task. It is the choice of a special task. In addition to the basic operation, its two properties ‘isCombinedFragment’ and ‘MethodAlt’ should be set to true. To accomplish this task, you need to perform two new tasks. The first one is MakeCashPayment, which is connected to the task Payment with ‘OrRefinement’. The second is ‘MakeCardPayment’, which is connected to the task Payment with ‘OrRefinement’.

  Then create a Role type customer, which is used to simulate the user's operation. The user's goal is only one ‘PurchaseGoods’, which is set as the goal element. In order to achieve this goal, two tasks need to be done. The first one is to ProvideProductInformation, which is connected with the goal with ‘AndRefinement’. The second is ‘pay’, which is also linked to the target with ‘AndRefinement’. The next step is to complete the information exchange between the cashier and the user. When the cashier goes to the ‘enterItem’ task, the user's ‘ProvideProductInformation’ task needs to provide the cashier with relevant product information. Use Resource (which belongs to Dependency type) to create the elements barcode and quantity to be passed. The two tasks are connected by ‘dependeElmt / dependerElmt’. When the cashier goes to the "makeCashPayment" task, the user's "pay" task needs to provide the cashier with relevant commodity information, use Resource to create the element amount that needs to be passed, and connect the task through dependeElmt / dependerElmt. When the cashier goes to the ‘makeCardPayment’ task, the user's ‘pay’ task needs to provide the cashier with relevant commodity information, use resource to create the elements ‘CardAccountNumber’, ‘expiryDate’ and ‘fee’ that need to be passed, and connect the three tasks through ‘dependeElmt / dependerElmt’.

  The last part is the entity part. You can fill in the required entity information in this part. Here, you can fill in the information mentioned in the UML domain diagram in ‘CashDesk’, Cashier, Payment, CashPayment, CardPayment, Item and SalesLineItem, and add the Item and SalesLineItem in them, Connect with Resources’s barcode and quantity.
  
## The transformation goal of the case
Next, we will give the ideal transformation result, which is divided into the following two parts. The first part is the Use Case Diagram, which describes the relationship between user Cashier and his Use Case. Then there is the System Sequence diagram,which describes the Use Case ‘processSale’.


**UML use case diagram of supermarket shopping system：**


![image](https://user-images.githubusercontent.com/49606429/133746673-d1d5377c-8951-4934-a099-248c82a6957e.png)


**UML system sequence diagram of supermarket shopping system：**
![image](https://user-images.githubusercontent.com/49606429/133746720-136bf1a5-a4ab-46ac-8b96-48b83a9ff0b7.png)

## Evaluation Results and Discussion
The transformation results are divided into the following two parts. The first part is a use case diagram, which describes the relationship between user Cashier and his/her UseCases. Then the system operations of the use cases processSale. 
 The transformation success rate from the Goal model to the top-level use case diagram can be reaches 100%. The success rate of the system operation and message can be reaches 87.2%.
 
**Transformation result from Goal model to Use Case diagram**

 ![image](https://user-images.githubusercontent.com/49606429/135118444-cda281b9-ed12-4dc8-86ac-aa3b9c4da8d6.png)


**Table of transformation results from target model to use case diagram：**
|Name|Actor|Use Case|Use Case diagram relationships|Success rate|
|:-----:|:-----:|:-----:|:-----:|:-----:|
|Goal2UML|2/2|4/4|4/4|100%|

Use Case diagram: 
transform role in Goal model into Actor in UML. The goal in the root node part of the Goal model is transformed into UML UC , that is, the goal without Refinement type connection is transformed into UC. And connect them to their respective actors.


**Conversion results from Goal model to system sequence diagram:**

![image](https://user-images.githubusercontent.com/49606429/135118796-832061ed-dab7-42bb-a600-7e9f3f5f8bfd.png)

**Table of transformation results from the Goal model to the system sequence diagram：**


|Name|System operation|System service|Success rate|
|:-----:|:-----:|:-----:|:-----:|
|Goal2UML|35/47|17/17|87.2%|

System sequence diagram: 
 each task in the Goal model is transformed into the corresponding interaction (Call Message, Return Message, Execution) and Service (Operation) in UML, and the Resource of Dependency in the Goal model is transformed into the corresponding Service (Operation) in UML.
 
 **Table of transformation results from target model to UML model:**
|Name|Use Case diagram|System Operations|Success rate|
|:-----:|:-----:|:-----:|:-----:|
|Goal2UML|100%|87.2%|93.6%|

 Current overall conversion success rate from goal model to use case model.The transformation success rate of the top-level use case diagram is 100%. Due to the lack of the information about the parameters, the transformation success rate of system operations is 87.2%, and the overall transformation success rate is 93.6%.


