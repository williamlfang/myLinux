# `git` 版本控制

## 生成 `ssh-key`

```bash
cd ~
ssh-keygen -t rsa -C 'william.lian.fang@gmail.com'

## 复制 id_rsa.pub，上传到 github SSH

ssh -T git@github.com

git config --global user.name williamlfang
git config --global user.email william.lian.fang@gmail.com 
```
