# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias mysql@gc='mycli -h 192.168.1.174 -P 3306 -u lfang -p aBc@123!'
alias mysql@fz='mycli -h hi-cloud.imwork.net -P 18749 -u fl -p abc@123'
alias mysql@local='mycli -h 127.0.0.1 -P 3306 -u fl -p abc@123'
alias mysql@166='mycli -h 192.168.1.166  -P 3306 -u fl -p abc@123'

alias fl@fz='sshpass -p "abc@123" ssh -q -l fl -p46250 hi-cloud.imwork.net'
alias fl@166='sshpass -p "abc@123" ssh -q -l fl 192.168.1.166'
alias fl@imwork='sshpass -p "abc@123" ssh -q -l fl -p58873 gczhang.imwork.net'
alias fl@135='sshpass -p "abc@123" ssh -q -l fl 192.168.1.135'
alias hy@135='sshpass -p "abc@123" ssh -q -l hy 192.168.1.135'
alias hy@166='sshpass -p "abc@123" ssh -q -l hy 192.168.1.166'

alias fl@gc='sshpass -p "abc@123" ssh -q -l lfang 192.168.1.174'
alias fl@ali='sshpass -p "abc@123" ssh -q -l fl 47.93.200.243'
alias root@ali='sshpass -p "Abcd@1234" ssh -q -l root 47.93.200.243'
alias root@166='sshpass -p "root@123" ssh -q -l root 192.168.1.166'
alias root@135='sshpass -p "hi-cloud@fuzhou" ssh -q -l root 192.168.1.135'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

# added by Anaconda3 4.2.0 installer
export PATH="/home/william/anaconda3/bin:$PATH"

# added by Anaconda2 4.0.0 installer
export PATH="/home/william/anaconda2/bin:$PATH"

## Clion
export PATH=/home/william/clion-2017.1.2/bin:${PATH}

## DataGrip
export PATH=/home/william/DataGrip-2017.1.4/bin:${PATH}

## Pycharm

export PATH=/home/william/pycharm-2017.1.3/bin:${PATH}

## Navicat
alias navicat=/home/william/Downloads/navicat112_premium_en_x64/start_navicat


