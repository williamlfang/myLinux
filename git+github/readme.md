# `git` 版本控制

## 生成 `ssh-key`

```bash
cd ~
ssh-keygen -C 'william.lian.fang@gmail.com' -t rsa

## 复制 id_rsa.pub，上传到 github SSH

ssh -T git@github.com

git config --global user.name williamlfang
git config --global user.email william.lian.fang@gmail.com 
```

## 添加 `.git-credentials`

> 每次登录或提交时不再输入账户名与密码。

```bash
vim .git-credentials

://{williamlfang}:{我的密码}@github.com
```

## 日常 `Git` 命令

```bash
## 从 GitHub 把项目复制到本地
cd <MyFolder>
git clone <MyProjectURL>

## 从 GitHub 服务器把最新的修改同步到本地
git pull

## 添加项目的所有文件
git add -A

## 添加当前文件夹下的所有文件
cd <MyFolder>
git add *

## 记录修改
git commit -m 'some notes'

## 提交修改
git push

## 显示历史记录
git log

## 不需要输入账户
git remote set-url origin https://williamlfang@github.com/williamlfang/myLinux.git
```

## 不需要输入账户和密码

1. 在 `/home/` 找到（建立） `.gitconfig`, 编辑

        [user]
            name = williamlfang
            email = william.lian.fang@gmail.com
        [push]
            default = matching

        [credential]
            helper = store

2. 找到（建立）`.git-credentials`，编辑

        https://williamlfang:我的密码@github.com

3. 在项目中建立 `.git-credentials`

        ://{williamlfang}:{我的密码}@github.com

这样，就可以通过 sublime 直接提交修改内容了。
