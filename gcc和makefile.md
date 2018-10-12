# gcc讲解 #
在使用gcc编译程序时，编译过程可以细分为４个阶段：
+ 预处理(Pre-Processing)
+ 编译(Compiling)
+ 汇编(Assembling)
+ 链接(Linking)

## 步骤分解
1. 第一步要进行预编译，使用-E参数可以让gcc在预处理结束后停止编译过程  
`gcc -E hello.c -o hello.`  
2. 第二步是将hello.i编译为目标代码，这可以通过使用-c参数来完成：  
`gcc -c hello.i -o hello.o`  
_注意_:gcc默认将.i文件看成是预处理后的C语言源代码，因此上述命令将自动跳过预处理步骤而开始执行编译过程，也可以使用-x参数让gcc从指定的步骤开始编译。  
3. 最后一步是将生成的目标文件链接成可执行文件：  
`gcc hello.o -o hello`

## 补充知识  
在采用模块化的设计思想进行软件开发时，通常整个程序是由多个源文件组成的，相应地就形成了多个编译单元，使用gcc能够很好地管理这些编译单元。假设有一个由`david.c`和`xueer.c`两个源文件组成的程序，为了对它们进行编译，并最终生成可执行程序`davidxueer`，可以使用下面这条命令：`gcc david.c xueer.c -o davidxueer`  
如果同时处理的文件不止一个，gcc仍然会按照预处理、编译和链接的过程依次进行。如果深究起来，上面这条命令大致相当于依次执行如下3条命令：  
`gcc david.c -o david.o`  
`gcc  xueer.c -o xueer.o`  
`gcc david.o xueer.o -o davidxueer`

# makefile
格式:
> target:dependencies  
>   command  
_command_前面是一个tab,而不是四个或者两个空格

运行:`make`
