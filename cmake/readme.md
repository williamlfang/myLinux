# 使用 `CMakeLists.txt`

> http://www.hahack.com/codes/cmake/

在 linux 平台下使用 CMake 生成 Makefile 并编译的流程如下：

- 编写 CMake 配置文件 `CMakeLists.txt` 。
- 执行命令 `cmake PATH` 或者 `ccmake PATH` 生成 `Makefile`。其中， PATH 是 `CMakeLists.txt` 所在的目录。
- 使用 `make` 命令进行编译。

```bash
cmake .
make

./runFun 
```


