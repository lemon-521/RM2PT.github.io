---
layout: page
title: RM2PT Tutorial
permalink: /tutorial/user/overview_cocome
typora-root-url: ../../../../rm2pt-website
---

# 0 下载与安装

截至2021.10，最新的版本号是[v1.2.1](https://github.com/RM2PT/Release/releases/tag/v1.2.1)，[官方仓库](https://github.com/RM2PT)提供了四个[例子](https://github.com/RM2PT/CaseStudies)。

安装前需要保证本机有JDK11以上环境，推荐[AdoptOpenJDK](https://adoptopenjdk.net)，请确保已设置好JAVA路径后解压下载文件，点击应用程序RM2PT，进入程序。



# 1 总览

## 1.1 RM2PT核心部件

以附带的CoCoMe为例，其文档目录如下：

│  .project
│
└─RequirementsModel
        cocome.aird
        cocome.remodel

在RM2PT中导入项目之后，可以发现cocome.aird还能展开为三个部分：**用例图**、**概念类图**、**系统时序图**。

![image-20210325213129243](../../../imgs/overview-cocome/image-20210325213129243.png)

而每个部分都能在cocome.remodel中找到对应代码，此外还有**系统操作合约**需要在cocome.remodel中进行编写。

### 1.1.1 \*.aird文件

该文件实现XMI（XML元数据交换）功能，解析 XML模板文档识别该元数据的信息，完成对元数据的存取交换功能。可以直观理解为各种UML图。其中，RequirementModel目录下的三种图（用例图、概念类图、系统时序图）和系统操作合约为主要操作区域。

### 1.1.2 \*.remodel文件

![image-20210325213440518](../../../imgs/overview-cocome/image-20210325213440518-1616681491606.png)

其中，UseCaseModel对应用例图、时序图和系统操作合约，即具体的代码逻辑；DomainModel对应概念类图，即类的定义（仅含属性，不包括方法）。

## 1.2 如何生成可运行的Prototype？

首先你需要完成用例图、概念类图、系统时序图和系统操作合约的编写。以上部分完成后，右键点击*.remodel文件->RM2PT->OO Prototype->Generate Desktop Prototype即可生成可运行的桌面程序。注意生成的时候没有选择带internal的那个，生成项目结果将在与原项目同级的目录下。

![image-20210325213652455](../../../imgs/overview-cocome/image-20210325213652455.png)

## 1.3 如何运行生成的Prototype？

![image-20210325213801840](../../../imgs/overview-cocome/image-20210325213801840.png)

以上为生成的原型程序的目录结构。右键点击pom.xml->Run as->Run configurations->在Main选项卡的Goals栏输入exec:java->RUN即可，如下图。

![image-20210325213814405](../../../imgs/overview-cocome/image-20210325213814405.png)

![image-20210325213822183](../../../imgs/overview-cocome/image-20210325213822183.png)



# 2 具体画图/编码方法

本部分均以官方示例项目COCOME为例，若有版本差异，以文件夹下的CoCoME为准。

## 2.1 用例图相关部件

用例图的编辑区域如下，主要包括：画布、快捷工具栏，属性栏。

![image-20210325213926822](../../../imgs/overview-cocome/image-20210325213926822.png)

在快捷工具栏中单击用例图组成对象（如参与者、用例），再单击画布上相应位置，即可添加对象或关系。选中对象后可以在属性栏编辑对象的属性，如对象名、描述、备注标签等。

![image-20210325213939876](../../../imgs/overview-cocome/image-20210325213939876.png)

用例图在\*.remodel文件中对应的代码部分为UseCaseModel开头的部分，即用例和参与者的声明。在使用过程中，建议直接在用例图上进行编辑和修改，尽量避免编辑\*.remodel文件修改用例图。

![image-20210325214015658](../../../imgs/overview-cocome/image-20210325214015658.png)

## 2.2 概念类图相关部件

概念类图的编辑区域主要有：画布、快捷工具栏、属性栏。

![image-20210325214039387](../../../imgs/overview-cocome/image-20210325214039387.png)

在快捷工具栏中单击组件，再单击画布上相应位置，即可添加对象或关系。

鼠标悬停在画布上静止不动一段时间，会出现快捷操作按钮（绿色的加号），单击按钮可以添加类。

![image-20210325214104490](../../../imgs/overview-cocome/image-20210325214104490.png)

鼠标单击类框体，会出现快捷操作按钮（紫色的加号），可以添加属性或枚举类型。

![image-20210325214059009](../../../imgs/overview-cocome/image-20210325214059009.png)

类的属性窗口如下，主要包括：CRUD自动生成选项，类名，描述。其中，CRUD自动生成选项勾选后，可以在remodel中自动生成该类的CRUD操作。

<img src="../../../imgs/overview-cocome/image-20210325214122536.png" alt="image-20210325214122536" style="zoom: 67%;" />

类的属性的属性窗口如下，主要包括：属性名和属性类型。类型包括String、Integer、Real、Boolean和Date。

<img src="../../../imgs/overview-cocome/image-20210325214140800.png" alt="image-20210325214140800" style="zoom:67%;" />

关系的属性窗口如下，主要包括：关系名、关系类型、可重复性。在本工具的类图中，关系可以理解为面向对象语言中，类定义中持有其他类的对象的引用。以下图中关系为例，当可重复性为1时表示一对一关系，BelongedCatalog表示Item类定义持有一个ProductCatalog对象的引用，即每样物品属于一个产品清单；当可重复性为\*时表示一对多关系，ContainedItems表示ProductCatalog类定义持有一个Item对象引用的集合，即每个产品清单包含多样物品，这里的关系会在后面的contract编写中用上。

<img src="../../../imgs/overview-cocome/wps1.jpg" alt="img" style="zoom:50%;" />

概念类图在remodel文件中对应的代码部分为DomainModel部分，即类和属性的声明。

<img src="../../../imgs/overview-cocome/image-20210325214220556.png" alt="image-20210325214220556" style="zoom:50%;" />

其中，“@AutoCRUD”对应类的自动生成CRUD选项；Entity头部为属性及其类型，[Refer]为类所具有的关系，“!”代表反向，“*”代表一对多关系；[INV]为类所具有的约束条件，与操作合约同样以OCL对象约束语言编写。

## 2.3 时序图相关部件

时序图的作用：表示一组有逻辑顺序的操作。以COCOME为例，Cashier在结账时，需要按顺序完成以下的步骤，每一个步骤都依赖于前一个步骤的成功执行。此类场景需要建立时序图。

<img src="../../../imgs/overview-cocome/image-20210325214243426.png" alt="image-20210325214243426" style="zoom: 67%;" />

时序图的创建方法：在用例图中双击一个用例，即可为这个用例创建对应的时序图，并在remodel文件中为其创建相应的Interaction和Service。

<img src="../../../imgs/overview-cocome/image-20210325214254827.png" alt="image-20210325214254827" style="zoom:67%;" />

时序图的编辑区域同样包括画布、工具栏和属性栏，注意需要把Execution拖到Service对应的虚线上，然后再添加CallMessage等。其中，CallMessage的属性栏如下，包括对应的系统操作，以及系统操作的参数。

<img src="../../../imgs/overview-cocome/image-20210325214303469.png" alt="image-20210325214303469" style="zoom:67%;" />

CombinedFragment的属性栏如下，包括一个下拉选单，选择loop或alt。

![image-20210325214317222](../../../imgs/overview-cocome/image-20210325214317222.png)

Operand（CombinedFragment的组成部分）的属性栏包括：操作的名称，操作的起始和结束位置。

![image-20210325214326621](../../../imgs/overview-cocome/image-20210325214326621.png)

时序图在remodel中的体现主要在以下几个地方：首先，在UseCaseModel中的用例声明处，会将用例与创建时序图时自动创建的SSD和Service进行绑定。

<img src="../../../imgs/overview-cocome/image-20210325214335475.png" alt="image-20210325214335475" style="zoom:50%;" />

第二，在添加至少一个CallMessage并保存后，remodel会自动生成对应的描述。此描述基本不可读，且不推荐进行修改。

<img src="../../../imgs/overview-cocome/image-20210325214343646.png" alt="image-20210325214343646" style="zoom:67%;" />

第三，在下方会生成相应的Service，且会为时序图中每一个CallMessage及对应的参数生成一个Operation。此处建议通过编辑时序图进行修改，编辑remodel可能会导致时序图无法保存。

<img src="../../../imgs/overview-cocome/image-20210325214350251.png" alt="image-20210325214350251" style="zoom:67%;" />

遇到无法保存的问题，可以代码保存，然后在可视化界面把之前绑定的给去掉

<img src="../../../imgs/overview-cocome/wps2.jpg" alt="img" style="zoom:67%;" />

然后重新绑定Service和Ssd，再将之前的代码选择性粘回来

## 2.4 操作合约相关部件

操作合约即remodel文件中的Contract，操作合约构成用例的具体实现。

![image-20210325214448962](../../../imgs/overview-cocome/image-20210325214448962.png)

### 2.4.1 Contract和Service的关系、用例和操作的对应关系

Service 就是流程图中的一系列操作，例如之前的ProcessSaleService就包括了许多操作，实现了支付的目的

Service是Contract的容器，所有的Contract都需要在一个Service中声明才能被顺利调用。从逻辑上来说，Service是Contract的集合，相关的Contract应该被归类在同一个Service中。

一个用例可以对应一个操作，也可以对应多个操作。	一个用例对应一个操作：以openStore（打开商店）为例，其参与者为storeManager（商店经理），归属的Service为CoCoMESystem。用例和操作通过相同的名称进行绑定。

一个用例对应多个操作：以processSale（处理销售）为例，其参与者为Cashier（柜台人员）。如下图：Contract声明在[Operation]下，此处Contract的参数不需要声明类型；此外，还可以声明一些作用域仅限于该Service的临时变量（该Service中的变量传递基本上就靠这个了）

<img src="../../../imgs/overview-cocome/image-20210325214554693.png" alt="image-20210325214554693" style="zoom:50%;" />

### 2.4.2 Contract详解

<img src="../../../imgs/overview-cocome/image-20210325214622871.png" alt="image-20210325214622871" style="zoom:67%;" />

解释一下，这里的Store是定义在CoCoME中的Entity

<img src="../../../imgs/overview-cocome/image-20210325214633588.png" alt="image-20210325214633588"  />

Contract包含：所属Service、Contract名、传入参数、返回值类型、definition、precondition、postcondition。其中，传入参数的变量名需要以小写开头，且与Service中声明的变量名相同。Definition通常完成查询操作；precondition表示前置条件，仅当该部分结果为true时，才能进入后置条件；postcondition表示后置条件，当前置条件结果为true时，后置条件语句一一执行，最终需要定义返回结果，且该结果的数据类型需要与之前定义的返回值类型相同。

这里还有一个带注释的contract

<img src="../../../imgs/overview-cocome/wps3.jpg" alt="img" style="zoom:67%;" />

其中小箭头(->)的官方解释：

> Collections, like Sets, OrderedSets, Bags, and Sequences are predefined types in OCL. They have a large number of predefined operations on them. A property of the collection itself is accessed by using an arrow ‘->’ followed by the name of the property.

官方文档放在RM2PT的目录中了，更多可查阅

# 3 一些Tips

## 3.1 AutoCRUD功能

在概念类图用例的Property栏中勾选了“Is CRUD”选项，或是在remodel文件的域模型中标注了“@AutoCRUD”后，即可对该类自动生成CRUD（创建、查找、修改、删除）操作。具体步骤如下：在remodel文件中任意处单击右键->RM2PT->Generate CRUD *。使用者可以先后使用Generate CRUD UseCase、Generate CRUD Service和Generate CRUD Contracts为该类创建用例、服务和操作合约。

注：生成的代码插入位置在光标处。

<img src="../../../imgs/overview-cocome/image-20210325214819395.png" alt="image-20210325214819395" style="zoom: 67%;" />

## 3.2 如何调试remodel文件

如果Remodel文件中contract的编写不正确，生成的Prototype将无法正确执行。由于工具对remodel文件目前词法分析和语法分析尚不完善，可能为调试带来困难，此时可以通过生成的prototype代码进行调试。

![image-20210325214851411](../../../imgs/overview-cocome/image-20210325214851411.png)

借助eclipse对java代码的词法语法检查，将prototype中src-gen/services.impl目录下的代码与contract进行对照，可以快速定位错误。



## 3.3 随时保存（Ctrl+S）

​	如题。养成每次编辑后都保存的习惯，越频繁越好。这样当遇到问题无s法保存时，能够及时定位错误来源。

## 3.4 检测重复

<img src="../../../imgs/overview-cocome/image-20210325215605751.png" alt="image-20210325215605751" style="zoom:67%;" />

如图，需要注意postcondition中声明的变量名不能和前面的重复，因为生成的java代码中命名会按照此处命名



# 4 常见的需求



## 4.1 如何处理contract中的多变量声明及共享

如图，现在有如下需求，创建一个Device，其中Device具有一个属性为Position，类型为Point，如何创建一个Device实例呢？

<img src="../../../imgs/overview-cocome/image-20210325215132580.png" alt="image-20210325215132580" style="zoom:67%;" />

一个直观的想法是直接声明

`let dev:Device, pt:Point`

然后赋值

`dev.Position = pt`

可惜这样的做法在OCL规范中并未出现过，当前版本（v1.2.1）实际运行也是不行的。

一个可行的做法是利用Service中可以定义TempProperty的特性，先在一个Contract中声明Point，再用一个中间变量保存，在另一个Contract中声明一个Device并获取此中间变量，作为其Position属性，使用时要注意，赋值时使用self.xxx，取值时直接xxx

<img src="../../../imgs/overview-cocome/image-20210325215458571.png" alt="image-20210325215458571" style="zoom:67%;" />



## 4.2 条件语句的使用

<img src="../../../imgs/overview-cocome/image-20210325215647019.png" alt="image-20210325215647019" style="zoom:67%;" />

这段Contract实现了查询或新建的功能
