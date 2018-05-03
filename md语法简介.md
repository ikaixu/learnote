第一次学习(关于标题使用类Setext形式)
==================================
1.1类 Setext 
------------
类 Setext 形式是用底线的形式，利用 = （最高阶标题）和 - （第二阶标题）。任何数量的 = 和 - 都可以有效果。

1.2类 atx 形式
--------------
类 Atx 形式则是在行首插入 1 到 6 个 # ，对应到标题 1 到 6 阶。
你可以选择性地「闭合」类 atx 样式的标题，这纯粹只是美观用的，若是觉得这样看起来比较舒适，你就可以在行尾加上 #，而行尾的 # 数量也不用和开头一样（行首的井字符数量决定标题的阶数）。

1.3关于类Setext形式说明：
--------------------
每个第二级标题之间要空一行才可以分开。不然，两个二级标题之间的内容都会作为标题出现。
下面的内容是想使用类atx的形式重写，但是最终结果并不理想，可能这里已经有了Setext形式的一级标题和二级标题。

#第一次学习（关于标题使用atx形式）#

##1.1类Setext##
类 Setext 形式是用底线的形式，利用 = （最高阶标题）和 - （第二阶标题）。任何数量的 = 和 - 都可以有效果。

##1.2类atx形式##
类 Atx 形式则是在行首插入 1 到 6 个 # ，对应到标题 1 到 6 阶。
你可以选择性地「闭合」类 atx 样式的标题，这纯粹只是美观用的，若是觉得这样看起来比较舒适，你就可以在行尾加上 #，而行尾的 # 数量也不用和开头一样（行首的井字符数量决定标题的阶数）。

##1.3关于类atx形式说明##

下面尝试使用类atx形式写，使用三级机以上标题。
###第一次学习（关于标题使用atx形式）###
####1.1类Setext####
类 Setext 形式是用底线的形式，利用 = （最高阶标题）和 - （第二阶标题）。任何数量的 = 和 - 都可以有效果。
####1.2类atx形式####
类 Atx 形式则是在行首插入 1 到 6 个 # ，对应到标题 1 到 6 阶。
你可以选择性地「闭合」类 atx 样式的标题，这纯粹只是美观用的，若是觉得这样看起来比较舒适，你就可以在行尾加上 #，而行尾的 # 数量也不用和开头一样（行首的井字符数量决定标题的阶数）。
####1.3关于类atx形式说明####

1.4结论：
---------
上面的实验可以看出，标题使用了类Setext形式，下面就不能使用类atx形式的方式去写。
 
 
 
第二次学习（有序列表和无序列表）
============================
2.1无序列表
-----------
三种实现方式：以 + 、 * 和 - 号打头开始，注意是英文符号，不能混用。无序列表使用星号、加号或是减号作为列表标记。
+ 2.1.1加号方式
* 2.2.2星号方式
- 2.2.3减号方式
+ 注意事项：加号与减号之后要加上一个空格，语法才有效。

2.2有序列表
------------
有序列表则使用数字接着一个英文句点
1. 有序列表使用数字接着一个英文句点
2. 数字接完英文句点之后，需要空格后写内容，语法才生效
3. 很重要的一点是，你在列表标记上使用的数字并不会影响输出的 HTML 结果。重点在于，你可以让 Markdown文件的列表数字和输出的结果相同，或是你懒一点，你可以完全不用在意数字的正确性。如果你使用懒惰的写法，建议第一个项目最好还是从1.开始，因为Markdown未来可能会支持有序列表的start属性。列表项目标记通常是放在最左边，但是其实也可以缩进，最多3个空格，项目标记后面则一定要接着至少一个空格或制表符。要让列表看起来更漂亮，你可以把内容用固定的缩进整理好。

## 反思：
第一次学习中，在#号后面加空格语法才可以生效。所以两种标题方式混用是可以的。

# 第三次学习 #
## 区块引用 ##
Markdown标记区块引用是使用类似email中用 > 的引用方式。如果你还熟悉在email信件中的引言部分，你就知道怎么在Markdown文件中建立一个区块引用，那会看起来像是你自己先断好行，然后在每行的最前面加上 > ：
> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> 
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.

Markdown 也允许你偷懒只在整个段落的第一行最前面加上 > ：
> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
id sem consectetuer libero luctus adipiscing.

区块引用可以嵌套（例如：引用内的引用），只要根据层次加上不同数量的 > ：
> This is the first level of quoting.
>
> > This is nested blockquote.
>
> Back to the first level.

## 段落 ##
一个 Markdown 段落是由一个或多个连续的文本行组成，它的前后要有一个以上的空行（空行的定义是显示上看起来像是空的，便会被视为空行。比方说，若某一行只包含空格和制表符，则该行也会被视为空行）。普通段落不该用空格或制表符来缩进。
「由一个或多个连续的文本行组成」这句话其实暗示了 Markdown 允许段落内的强迫换行（插入换行符），这个特性和其他大部分的 text-to-HTML 格式不一样（包括 Movable Type 的「Convert Line Breaks」选项）。

## 列表 ##
要让列表看起来更漂亮，你可以把内容用固定的缩进整理好：
*   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
    Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,
    viverra nec, fringilla in, laoreet vitae, risus.
*   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.
    Suspendisse id sem consectetuer libero luctus adipiscing.

列表项目可以包含多个段落，每个项目下的段落都必须缩进 4 个空格或是 1 个制表符：
*	1个制表符

    4个空格

如果要在列表项目内放进引用，那 > 就需要缩进：
*   A list item with a blockquote:

    > This is a blockquote
    > inside a list item.

如果要放代码区块的话，该区块就需要缩进两次，也就是 8 个空格或是 2 个制表符：
*	一个列表项包含一个列表区块：
		
		<代码写在这里>