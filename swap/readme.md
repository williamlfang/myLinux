# `swap` 增加内存

```bash
free -m

## 1. 使用dd命令创建一个swap交换文件
dd if=/dev/zero of=/home/swap bs=1024 count=1024000

## 2. 制作为swap格式文件：
mkswap /home/swap

## 3. /sbin/swapon /home/swap
/sbin/swapon /home/swap

## 4. 为防止重启后swap分区变成0，要修改/etc/fstab文件
vim /etc/fstab

## 在文件末尾（最后一行）加上
/home/swap swap swap default 0 0

```
