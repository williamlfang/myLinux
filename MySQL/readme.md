# `MySQL` 数据库管理

## `MySQL` 系统配置

```bash
## 查找 MySQL 位置文件

mysql --help | grep my.cnf

## CentOS
vim /etc/my.cnf

## Ubuntu
vim /etc/mysql/mysql.conf.d/mysqld.cnf

service mysqld restart
```

### `my.cnf` 配置

    [mysqld]
    default-character-set=utf8

    ##-------------------------------
    ## 数据库路径
    ## datadir=/var/lib/mysql
    datadir= /data/Database/mysql/
    ##-------------------------------
    
    #socket=/var/lib/mysql/mysql.sock
    socket=/data/Database/mysql/mysql.sock
    user=mysql
    # Disabling symbolic-links is recommended to prevent assorted security risks
    symbolic-links=0
    #skip-grant-tables
    set-variable=max_connections=1000
    skip-name-resolve
    log-bin=mysql-bin:


    [client]
    default-character-set=utf8
    socket=/data/Database/mysql/mysql.sock

    [mysql]
    default-character-set=utf8
    socket=/data/Database/mysql/mysql.sock


    [mysqld_safe]
    log-error=/var/log/mysqld.log
    pid-file=/var/run/mysqld/mysqld.pid



