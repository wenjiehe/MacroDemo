# MacroDemo

## 前言

> 预处理是文件编译过程的第一步，相当于在编译之前先对源文件进行处理，预处理主要是处理以`#`开头的命令。主要包括#import头文件，以及一些`#`开头的命令。预处理命令能够根据不同情况编译不同代码、产生不同目标文件的机制，称为条件编译。条件编译是预处理程序的功能，不是编译器的功能。

> 所谓`宏定义`，就是用一个标识符来表示一个字符串。

> 宏定义的一般形式为:

```
#define 宏名 字符串
```

> `#`表示这是一条预处理命令，所有的预处理命令都以`#`开头。`宏名`是标识符的一种，命名规则和变量相同。`字符串`可以是数字、表达式、if语句、函数等。 

* 对#define 用法的几点说明

    -  宏定义是用宏名来表示一个字符串，在宏展开时又以该字符串取代宏名，这只是一种简单粗暴的替换。字符串中可以含任何字符，它可以是常数、表达式、if 语句、函数等，预处理程序对它不作任何检查，如有错误，只能在编译已被宏展开后的源程序时发现。
    
    - 宏定义不是说明或语句，在行末不必加分号，如加上分号则连分号也一起替换。
    
    - 宏定义必须写在函数之外，其作用域为宏定义命令起到源程序结束。如要终止其作用域可使用`#undef`命令。
    
    - 代码中的宏名如果被引号包围，那么预处理程序不对其作宏代替
    
    - 宏定义允许嵌套，在宏定义的字符串中可以使用已经定义的宏名，在宏展开时由预处理程序层层代换。
    
    - 习惯上宏名用大写字母表示，以便于与变量区别。但也允许用小写字母。
    
    - 可用宏定义表示数据类型，使书写方便。

## C语言的预处理命令

1. #if的用法

```
#if 整型常量表达式1
    程序段1
#elif 整型常量表达式2
    程序段2
#elif 整型常量表达式3
    程序段3
#else
    程序段4
#endif
```

> 它的意思是：如常“表达式1”的值为真（非0），就对“程序段1”进行编译，否则就计算“表达式2”，结果为真的话就对“程序段2”进行编译，为假的话就继续往下匹配，直到遇到值为真的表达式，或者遇到 #else。

> 需要注意的是，#if 命令要求判断条件为“整型常量表达式”，也就是说，表达式中不能包含变量，而且结果必须是整数；而 if 后面的表达式没有限制，只要符合语法就行。这是 #if 和 if 的一个重要区别。

2. #ifdef 的用法

```
#ifdef  宏名
    程序段1
#else
    程序段2
#endif
```

> 它的意思是，如果当前的宏已被定义过，则对“程序段1”进行编译，否则对“程序段2”进行编译。

3. #ifndef 的用法

```
#ifndef 宏名
    程序段1 
#else 
    程序段2 
#endif
```

> 它的意思是，如果当前的宏未被定义，则对“程序段1”进行编译，否则对“程序段2”进行编译，这与 #ifdef 的功能正好相反。

4. #undef

> 取消已定义的宏

5. #import

> 在该文件中读取并包括另一个源文件。自动防止多次包含该文件

6. #include 

> 在该文件中读取并包括另一个源文件。不会防止多次包含该文件

7. #pragma 

> 用于配置编译器和IDE注释的特殊宏 

8. #warning

> 产生一个编译器警告

9. #error

> 产生一个编译器错误

10. #endif

> 终止#if、#ifdef、#else或#elif代码块


## Xcode如何查看预处理和预编译阶段

 ![查看预处理和预编译阶段](https://github.com/wenjiehe/MacroDemo/blob/master/MacroDemo/macro.png)

> Navigate to Related Items -> Preprocess, 对宏预处理之后的样子,可以查看预编译后的宏代码是否正确

> Navigate to Related Items -> Assembly,对源码转成汇编的样子

> 不同阶段的Preprocess或Assembly,都有5种预编译的种类可以选择,分别是

 - Running
 
 - Testing
 
 - Profiling
 
 - Archiving
 
 - Analyzing
