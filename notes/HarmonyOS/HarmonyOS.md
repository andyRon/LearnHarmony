HarmonyOS开发应用从入门到实战
---

[HarmonyOS4+NEXT星河版入门到企业级实战教程](https://www.bilibili.com/video/BV1Sa4y1Z7B1)



## 介绍

`鸿蒙OS = 开源鸿蒙 + 安卓兼容层 + 华为自研的能力（不开源）`

华为自研能力是什么意思呢？举个例子，华为有个骨节敲击截屏的功能，这个功能是其他手机都没有的，是它自研的算法，所以它不开源，不对外，形成自己的特色，并用专利保护起来，形成壁垒和行业差异化竞争。

`鸿蒙OS Next = 开源鸿蒙 + 华为自研能力（不开源）`

开源鸿蒙是鸿蒙最基础的形态，但是由于初始阶段，不成熟也没有配套的软件（微信，淘宝和抖音没有纯鸿蒙版本），所以必须加了安卓兼容层，野蛮生长，经过了4年多的迭代，系统已经成熟了，可以剔除安卓兼容层了。

![](images/image-20240124191155279.png)

### 鸿蒙开发用语言

两种开发方向：

- 系统级别的开发，比如驱动，内核和框架层的开发，这种开发以C/C++为主
- 应用级别的开发，从API8开始，只能用Arkts（ets），js或着C++开发了

![](images/b3cbdcd88342499db66c619275c0f8b1.png)

ets的性能在正常情况下是无法比得过Java的执行效率，而在方舟编译器和毕昇编译器的特别优化下，可以取得更高地执行效率；之所以选择ts作为开发语言，因为每一个系统都需要配套的生态软件才能长久，而Java需要拖一个JVM，会降低运行效率，而C++门槛比较高，所以选择了有一定开发者基数，没有版权问题，且还能通过编译器提高运行效率的语言，所以华为选择了TypeScript。
![](images/18e9c4c5470746449ad28d9e2ea226e4.png)



### 宏内核和微内核

宏内核

微内核

混合内核



#### 鸿蒙设备分级

![](images/8b5b39d0e03f4368b1d3dd0b2964e48c.png)

1、Linux 面向手机 (L5级别设备) 

2、LiteOS-a 面向有MMU的设备 (>=L1级别且<L5) 

3、LiteOS-m 面向无MMU的嵌入式设备 (L0级别)

目前并非所有的鸿蒙版本都是使用的微内核，对于L5以下的设备，由于设备功能比较单一， 不需要那么多功能，所以资源的分配和争夺并不激烈，是可以通过微内核达到自由裁剪的目的，一次开发多段部署。

> MMU是Memory Management Unit的缩写，中文名是内存管理单元，有时称作分页内存管理单元（英语：paged memory management unit，缩写为PMMU）。它是一种负责处理中央处理器（CPU）的内存访问请求的计算机硬件。它的功能包括虚拟地址到物理地址的转换（即虚拟内存管理）、内存保护、中央处理器高速缓存的控制，在较为简单的计算机体系结构中，负责总线的仲裁以及存储体切换（bank switching，尤其是在8位的系统上）。



微内核和宏内核各有各的好处，而现在鸿蒙系统，除了L5级别，由于设备的高要求，无法达到所需的高实时性，还用着Linux的内核，其他设备已经全部使用鸿蒙内核（LiteOS-m和LiteOS-A，根据设备的等级，选择不同的内核），希望在华为的努力下，L5也可以接入微内核，让我们一起期待！


### 课程介绍

![](images/image-20240124200159866.png)



![](images/image-20240124200604653.png)

![](images/image-20240124200726800.png)

## 1 开发准备

### 熟悉鸿蒙官网

https://developer.harmonyos.com/

https://developer.huawei.com/consumer/cn/



### 安装DevEco Studio

 安装sdk失败

## 2 了解ArkTS语言

网页开发需要三门语言：

![](images/image-20240201232422926.png)

鸿蒙只需要ArkTS（语法和TypeScript类似）

![](images/image-20240201232921832.png)

ArkTS优势：

- 开发效率高、开发体验好
- 性能优越
- 有多系统适配，接入能力

![](images/image-20240201233217935.png)

### TypeScript语法

#### 变量声明

TypeScript在JavaScript的基础上加入了静态类型检查功能，因此每一个变量都有固定的数据类型。

```typescript
let msg: string = 'hello world'
```

![](images/image-20240201233943175.png)

![](images/image-20240201233958738.png)

[TypeScript官方网站](https://www.typescriptlang.org/)提供了ts的运行环境：https://www.typescriptlang.org/play

#### 条件控制

if-else  

switch

```typescript
let num: number = 21

if (num % 2 === 0) {
	console.log(num + '是偶数')
} else {
  console.log(num + '是奇数')
}

if (num > 0) {
  console.log(num + '是正数')
} else if (num < 0) {
  console.log(num + '是负数')
} else {
  console.log(num + '为0')
}
```

> 在TypeScript中，空字符串、数字0、null、undefined都被认为是false，其它值则为true。

```typescript
let grade: string = 'A'
switch (grade) {
  case 'A': {
    console.log('优秀')
    break
  }
  case 'B': {
    console.log('合格')
    break
  }
  case 'C': {
    console.log('不合格')
    break
  }
  default: {
    console.log('非法输入')
    break
  }
}
```

#### 循环迭代

for

while

为一些内置类型如Array等提供了快捷迭代语法。

```typescript
let names: string[] = ['jack', 'rose']
// for in 迭代器，遍历得到数组角标
for (const i in names) {
  console.log(i + ':' + names[i])
}
// for of 迭代器，直接得到元素
for (const name of names) {
  console.log(name)
}
```

#### 函数

利用`function`关键字声明函数，并且支持可选参数、默认参数、箭头函数等特殊语法。

```typescript
// 无返回值函数，返回值void可以省略
function sayHello(name: string): void {
  console.log('你好, ' + name + '!')
}
sayHello("andy")

// 有返回值函数
function sum(x: number, y: number): number {
  return x + y
}
let res = sum(21, 18)
console.log('21 + 18 = ' + res)

// 箭头函数
let sayHi = (name: string) => {
  console.log('你好, ' + name + '!')
}
sayHi('rose')

// 可选参数，在参数名后加?，表示该参数是可选地的
function sayHello2(name?: string) {
  // 判断name是否有值，如果无值则给一个默认值
  name = name ? name : '陌生人'
  console.log('你好, ' + name + '!')
}
sayHello2('andy')
sayHello2()

// 参数默认值，如果调用者没有传参，则使用默认值
function sayHello3(name: string = '陌生人') {
  console.log('你好, ' + name + '!')
}
sayHello3('tom')
sayHello3()
```

#### 类和接口

TypeScript具备面向对象编程的基本语法，例如interface、class、enum等。也具备封装、继承、多态等面向对象基本特征

```typescript
// 枚举，可以赋值，如果不赋值就是数字
enum Msg {
  HI = 'Hi',
  HELLO = 'Hello'
}

// 定义接口
interface A {
  say(msg: Msg): void
}
// 实现接口
class B implements A {
  say(msg: Msg): void {
    console.log(msg + ', I am B')
  }
}

// 初始化对象
let a: A = new B() 
// 调用方法
a.say(Msg.HI)
```



![](images/image-20240202001357090.png)

#### 模块开发

应用复杂时，可以通过通用功能抽取到单独的ts文件中，每个文件都是一个模块（module），模块可以相互加载，提高代码复用性。

![](images/image-20240202001834724.png)

## 3 快速入门

![](images/image-20240202002437917.png)

![](images/image-20240202002427632.png)

 ![](images/image-20240202002834592.png)



![](images/image-20240202003256083.png)

`@Entry`，入口组件可以被独立访问



## 4 基础组件

![](images/image-20240202095416072.png)

### Image

![](images/image-20240202095758144.png)

> [安装模拟器](https://b11et3un53m.feishu.cn/wiki/LGprwXi1biC7TQkWPNDc45IXndh)

网络图片，需要配置权限：[安全-访问控制](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/accesstoken-overview-0000001544703857-V3)

文件`module.json5`：

```json
{
  "module": {
    "requestPermissions": [
      {
        "name": "ohos.permission.INTERNET"
      }
    ],
```

> ide中，鼠标悬乎看文档



### Text：文本显示组件

![](images/image-20240202105406646.png)

base目录相当于一个默认目录



### TextInput：文本输入框

![](images/image-20240202110511018.png)



### Button

![](images/image-20240202112033194.png)



### Slider:滑动条组件

![](images/image-20240202112800827.png)

## 5 页面布局

![](images/image-20240202113822356.png)

![](images/image-20240202113910326.png)

![](images/image-20240202114057361.png)

![](images/image-20240202114301106.png)

![](images/image-20240202114320620.png)

![](images/image-20240202114417530.png)

![](images/image-20240202115848973.png)



## 6 渲染控制
