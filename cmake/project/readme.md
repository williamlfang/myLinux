# 多个目录，多个源文件

```bash
.
├── CMakeLists.txt
├── main.cc
├── math
│   ├── CMakeLists.txt
│   ├── MathFunctions.cc
│   └── MathFunctions.h
└── readme.md

1 directory, 6 files
```

对于这种情况，需要分别在项目根目录 Demo3 和 math 目录里各编写一个 `CMakeLists.txt` 文件。为了方便，我们可以先将 math 目录里的文件编译成静态库再由 main 函数调用。

## 根目录的 `CMakeLists.txt`

```bash
# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.8)

# 项目信息
project (Demo3)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 添加 math 子目录
add_subdirectory(math)

# 指定生成目标
add_executable(Demo ${DIR_SRCS})

# 添加链接库
target_link_libraries(Demo MathFunctions)
```

该文件添加了下面的内容: 第3行，使用命令 add_subdirectory 指明本项目包含一个子目录 math，这样 math 目录下的 CMakeLists.txt 文件和源代码也会被处理 。第6行，使用命令 target_link_libraries 指明可执行文件 main 需要连接一个名为 MathFunctions 的链接库 。

## 子目录中的 `CMakeLists.txt`

```bash
# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(. DIR_LIB_SRCS)

# 指定生成 MathFunctions 链接库
add_library (MathFunctions ${DIR_LIB_SRCS})
```

总结：
1. 在根目录 `CMakeLists.txt` 增加
    
    - 增加子目录： add_subdirectory(subPath)
    - 增加链接库： target_link_libraries(Demo MathFunctions)

2. 在子目录 `CMakeLists.txt` 编写：

    - aux_source_directory(. DIR_LIB_SRCS)
    - 生成链接： add_library(MathFunctions ${DIR_LIB_SRCS})

