# 如果 ~/.bashrc 存在，则加载它
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Prompt
export PS1='[\u] \W\$ '

# 常用别名
alias ll='ls -lF'
alias pip3='python3 -m pip'
alias pip='python3 -m pip'
alias python='python3'
alias rrm='/bin/rm'
alias rm='trash'

# 网络代理
source /etc/network_turbo
alias vpn='source /etc/network_turbo'
alias novpn='unset http_proxy && unset https_proxy'

# 软删除：将文件移入回收站
trash() {
    mv "$@" ~/.Trash/
}

# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# 终端颜色配置
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
export TERM='xterm-color'

# PATH 配置
export PATH="$PATH:/Users/hongxia/Codes/Third/gradle-7.4.2/bin"
export PATH="$PATH:~/Library/Python/2.7/bin/"

# Homebrew（可选）
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
# eval $(/usr/local/Homebrew/bin/brew shellenv)

pyformat() {
    autopep8 --in-place --aggressive --aggressive "$@"
    isort "$@"
}
