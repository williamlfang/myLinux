# Emacs 学习之路

## 配置

### 配置目录

默认的启动配置文件是 `~/.emacs`，如果想要把配置文件设置成一套目录，则需要处理以下两步：

- 删除 ~/.emacs 文件
- 在 ~/.emacs.d 添加 init.el

### 初始化配置文件

`~/.emacs.d/init.el` 的内容如下：

```Emacs
;; =============================================================================
;; william
;; 2018-01-30
;; 
;; 1. 删除 ~/.emacs 文件
;; 2. 在 ~/.emacs.d 添加 init.el
;; =============================================================================

(add-to-list 'load-path "~/.emacs.d/lisp")

;;;;;;;;;;;;;;;;;;;;;;;;;
;; theme
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-themes)
```

引用的包需要在末尾添加以下命令，实现 `featuers` 的功能，即可在 `init.el` 通过使用 `(require 'init-themes)` 来获取：

```
## 在 init.el 引用包
(require 'init-themes)
```

```
## 设置路径
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/")

## ...
## 其他操作命令
## ...

## 在每个包添加一行
(provide 'init-themes)
```

### 安装 package

可以通过查找 [melpa.org](https://melpa.org/) 来查找需要的 packages。

使用 `Mata-x package-install RET pkg_name` 进行安装。记得使用 `Tab` 键来自动补全。

### `init-elpa`

```
;;;;;;;;;;;;;;;;;;;;;;;;;
; install packages
;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lisp")
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
            ;; 安装包列表
            ;; 可以去 MELPA 查询
            company
            atom-dark-theme
            markdown-mode+
           ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
      when (not (package-installed-p pkg)) do (return nil)
      finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
    (package-install pkg))))

;; ===================
(provide 'init-elpa)
;; ===================
```

### `init-themes`

可以下载 [`one-dark-theme.el`](https://github.com/whitlockjc/atom-dark-theme-emacs) 到 `~/.emacs.d/lisp/themes/`

```
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/")
(load-theme 'atom-dark t)

;;;;;;;;;;;;;;;;;;;;;;;;;
;open linum mode
;;;;;;;;;;;;;;;;;;;;;;;;;
(setq linum-format "%4d \u2502")
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'ess-mode-hook 'linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; 隐藏状态栏、工具栏、滚动条
;;;;;;;;;;;;;;;;;;;;;;;;;
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; 最大化屏幕
;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; ===================
(provide 'init-themes)
;; ===================
```




