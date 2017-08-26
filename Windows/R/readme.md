# `Windows` 系统下 `R` 环境设置

## 安装

一般情况下，需要安装的软件有

- `R.exe`：这个是 `R` 的主程序安装包。
- `Rtools.exe`：为了以后能够用**开发者的角色**来安装一些第三方的软件包，需要我们安装这个`Rtools`,一般是安装在 `c:/Rtools/` 系统盘的文件夹下面。
- `RStudio.exe`：非常好用的一个 `IDE`，集合了写码与画图于一体。

## 寻找 `zip.exe`
为了使用 `openxlsx` 的软件包来处理表格数据，有时候系统会提示我们需要手动来设置 `zip.exe` 的路径，这个主要在原来安装 `Rtools` 这个软件的时候，设置不同的路径导致的。一般而言，是在系统盘 `c:/Rtools` 下面可以找到。

```R
if(Sys.info()['sysname'] == 'Windows'){
  Sys.setenv("R_ZIPCMD" = "c:/Rtools/bin/zip.exe") ## path to zip.exe
}
```
