# `Ubuntu` 允许远程 `ssh` 访问

> 通过 `ssh` 远程访问
> 
> SSH 服务器，可以通过 SSH 协议来访问远程服务器，代替原来的 `telnet` 和 `ftp`。但是默认的 `Ubuntu` 配置是不启动 root 用户访问，也不允许 root 用户远程登录，所以需要开启 root 用后远程访问的权限。

1. 安装 `OpenSSH server`
    
    sudo apt install openssh-server

2. 设置 `/etc/ssh/sshd_config`， 找到 `PermitRootLogin no` 这一行，替换为 `PermitRootLogin yes`

    sudo vim /etc/ssh/sshd_config
    PermitRootLogin yes

3. 重新启动 `OpenSSH`

    sudo service ssh restart

4. 现在可以试试看用 `root` 用户权限，在另外一台机子访问

    ## root
    ssh root@192.168.1.119
    
    ## william
    ssh william@192.168.1.119

