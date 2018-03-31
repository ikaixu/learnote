import sys
import stdio

#stdio.writeln("Hi, ")
#stdio.writeln(sys.argv[1])
#stdio.writeln(". How are you?")

#sys是python的内置模块，这里调用了其argv功能，用于储存命令行参数。
#不能使用函数writeln()，这个函数会换行。

#stdio.write("Hi, ")
#stdio.write(sys.argv[1])
#stdio.write(". How are you?")

#最后一行不换行会难看，再改。

stdio.write("Hi, ")
stdio.write(sys.argv[1])
stdio.writeln(". How are you?")
