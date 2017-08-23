对于简单的项目，只需要写几行代码就可以了。例如，假设现在我们的项目中只有一个源文件 main.cc ，该程序的用途是计算一个数的指数幂。

首先编写 CMakeLists.txt 文件，并保存在与 main.cc 源文件同个目录下：

CMakeLists.txt 的语法比较简单，由命令、注释和空格组成，其中命令是不区分大小写的。符号 # 后面的内容被认为是注释。命令由命令名称、小括号和参数组成，参数之间使用空格进行间隔。

对于上面的 CMakeLists.txt 文件，依次出现了几个命令：

- `cmake_minimum_required`：指定运行此配置文件所需的 CMake 的最低版本；
- `project：参数值是 Demo1`，该命令表示项目的名称是 Demo1 。
- `add_executable`： 将名为` main.cpp` 的源文件编译成一个名称为 Demo 的可执行文件。

```bash
cmake .
make

./Demo 2 10
```

