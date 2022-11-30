# Use Case Editor主要结构：

   自然语言编译器主要由用例描述组成，我们将以用户故事的形式展现，用户在书写需求时可以将用例描述细化为两个部分：1.基本流程：该部分主要以EARS形式呈现，用户在书写时可以描述当前需求为用户需求或者系统需求以及他们之间的执行顺序。2.补充信息：该部分主要的书写内容为，在当前用例下，在与遇到特殊情况系统应当作出怎样的行动。

   ![图片](imgs/JG1.png)

## 用例描述（用户故事形式）：

### 用户故事
   用户故事更容易理解，用户故事基本不包含专业术语，若组织成故事，那么会增强人们对故事的记忆。其结构较为简单方便更改，在客户，开发人员及用户之间谈论需求时，短时间的及时反馈能促进相互学习与理解。
   
   一个完整的用户故事包含三个要素：
   角色（who）：谁要使用这个
   活动（what）：要完成什么活动
   价值（value）：为什么要这么做，这么做能带来什么价值


### 案例讲解
   该部分采用基础用户故事形式，作为一个<用户角色>, 我想要<完成活动>, 以便于<实现价值>。案例中红色字段为必填项，紫色字段为选填项。
   
   ![图片](imgs/US.png)

## 用例内部表述（EARS形式）案例：

### EARS
   在软件工程中，NL需求文档中可能 出现的一些问题：歧义、模糊性、复杂性、重复、需求的不恰当、不 可测试性。为了消除这些问题，引入了半结构化的自然语言Easy Approach to Requirements Syntax（EARS）。EARS是半结构化自然语言，相对简单，易于学习。EARS是一 种使用五个简单模板编写SRS文档的方法。 
#### Ubiquitous requirements(普遍存在、无处不在的)
没有任何先决条件或触发器。它不会由在系统检测到的事件或处于定义的系统状态而调用，但它是始终处于活动状态。syntax : The (system name) shall (system response)
例子:“The control system shall prevent engine overspeed”控制系统应防止发动机超速

#### Event-driven requirements(事件驱动)
只有当在系统检测到触发事件发生时，系统才有的响应。关键字“when”用于事件驱动的需求。syntax :WHEN (optional preconditions) (trigger) the (system name) shall (system response)
例子:“When continuous ignition is commanded by the aircraft, the control system shall switch oncontinuous ignition”当飞机发出连续点火指令时，控制系统应接通连续点火开关。

#### State-driven requirements(状态驱动)
当系统处于定义的某个状态时，系统才有的响应。syntax : WHILE (in a specific state) the (system name) shall (system response)
例子：“While the aircraft is in-flight, the control system shall maintain engine fuel flow above XXlbs/sec”当飞机在飞行中，控制系统应保持发动机燃油流动在XXlbs /sec 以上.

#### Unwanted behaviour requirements(不想要的行为需求)
涵盖所有不良情况。这包括故障，干扰，与所需用户行为的偏离以及交互系统的任何意外行为。不想要的行为是早期需求遗漏的主要来源，因此需要进行昂贵的返工。使用关键字If和Then来指定不想要的行为。syntax : IF (optional preconditions) (trigger), THEN the (system name) shall (system response) 
例子：“If an invalid credit card number is entered, then the website shall display “please re- enter credit card details.” 如果输入的信用卡号码无效，则网站将显示“请重新输入信用卡详细信息”。

#### Optional feature requirements（可选的特性需求）
在系统中，用于指定特性，用关键字Where表示 syntax : WHERE (feature is included) the (system name) shall (system response)
例子: “Where the control system includes an overspeed protection function, the control system shall test the availability of the overspeed protection function prior to aircraft dispatch.” 例子：控制系统包括超速保护功能的，控制系统应在飞机调度前测试超速保护功能的可用性。

   ![图片](imgs/EARS1.png)
   
### 案例讲解
   该部分采用基础EARS形式，本部分整体为选填项，当需要对用例进行内部描述时进行填写，其中NUM.后面的需要表述当前需求是用户需求还是系统需求（User/System），另外案例中红色字段为必填项，紫色字段为选填项。
   
   ![图片](imgs/EARSn.png)

## 补充信息案例：

   该部分采用基本的自然语言描述形式，对需求的细节进行补充，另外案例中红色字段为必填项，紫色字段为选填项，对细节进行补充。

  ![图片](imgs/KCn.png)
  
## 案例：

 ![图片](imgs/AL.png)
  
# Use Case Editor安装说明：

1.从北航云盘下载org.xtext.example.requirements.updatesite-1.0.0-SNAPSHOT.zip。

2.在RM2PT工具中，从主菜单栏Help → Install New Software 打开安装窗口。

3.点击Add，在弹出窗口中点击Archive，选择之前下载的.zip文件，点击Add确认添加。

4.添加.zip(即updatesite文件)之后，在下方会出现图1中的Feature，勾选之后默认Next即可安装。

5.安装过程中，出现提示，选择Install anyway。

6.安装完成后，软件提示重启以生效，重启即可。

7.重启后在任意文件夹下新建后缀名为.re的文件，按后续介绍书写自然语言需求，关键词会出现高亮，说明插件安装成功。

  ![图片](imgs/uce.png)

