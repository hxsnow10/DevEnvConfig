alias ll='ls -lF'
export PS1='[\u] \W\$ '
alias pip3='python3 -m pip'
alias pip='python3 -m pip'
alias python='python3'
alias rrm='/bin/rm'
alias rm=trash
trash()
{
  mv $@ ~/.Trash/
}
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# enables colorin the terminal bash shell export
export CLICOLOR=1
# sets up thecolor scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad
# sets up theprompt color (currently a green similar to linux terminal)
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
# enables colorfor iTerm
export TERM=xterm-color
export PATH=$PATH:/Users/hongxia/Codes/Third/gradle-7.4.2/bin

# alias python='python3'

  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles #ckbrew
  eval $(/usr/local/Homebrew/bin/brew shellenv) #ckbrew

export PATH=$PATH:~/Library/Python/2.7/bin/

pyformat(){
    autopep8 --in-place --aggressive --aggressive $@
    isort $@
}

