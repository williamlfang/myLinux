# `Unix` 常用操作命令

## 系统运行管理

### `free`：查看内存使用情况

```bash
free -h

              total        used        free      shared  buff/cache   available
Mem:            19G        4.2G        8.2G        959M        7.1G         13G
Swap:           15G          0B         15G
```

## 系统时间校准

```bash
## 校准北京时间
sudo /usr/sbin/ntpdate-debian

## 写入 bios
sudo hwclock --systohc

hwclock --show 
```


