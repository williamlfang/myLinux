# `shell` 编程

## 文件表头

最好在文件表头添加：

> #!/bin/bash

## 执行文件

需要通过 **增加执行权限**：

> chmod +x file.sh
> ./file.sh

## 获取变量
> 变量赋值使用 `=` 时，不能有空格！！！

```bash
v=$(date +"%Y-%m-%d %M:%H:%S")
echo $v

## 也可以使用 `{}` 把变量包围起来
echo ${v}

## 使用 `-e` 增加 `echo` 转义字符
echo -e "\n Hello, world! \n"
```

## 日期格式命名的文件

- 使用 `+` 来拼接
- 使用 `-d "1 days"` 来增加或者 `-d "-1 days"`减少日期

```bash
dataFile=$(date -d "-$i days" +"%Y%m%d")

echo $dataFile
```

## `for` 循环

```bash
for colo in XiFu YY1;
do
    for info in ContractInfo TickData;
    do 
        for i in {1..0}
        do
        dataFile=$(date -d "-$i days" +"%Y%m%d.csv")
        echo -e "\n$colo :==> $info :==> $dataFile"
        done
    done
done
```

