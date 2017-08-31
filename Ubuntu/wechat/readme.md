# `Ubuntu` 系统安装微信(`wechat`)

> https://github.com/geeeeeeeeek/electronic-wechat/releases

1. 下载安装包：[Linux 64位](https://github.com/geeeeeeeeek/electronic-wechat/releases/download/V2.0/linux-x64.tar.gz)

2. 解压到当前文件夹

3. 进入文件夹，直接打开 `electronic-wechat` 即可登录

4. 如果需要生成链接，可以编辑以下 `wechat.desktop`，并放在 `/home/william/.local/share/applications`

        [Desktop Entry]
        Encoding=UTF-8
        Version=1.0
        Name=wechat
        GenericName=wechat
        Exec=/home/william/Downloads/electronic-wechat-linux-x64/electronic-wechat
        Terminal=false
        Icon=/home/william/Downloads/electronic-wechat-linux-x64/wechat.jpg
        Type=Application
        Comment=wechat_web
        Categories=Application;
