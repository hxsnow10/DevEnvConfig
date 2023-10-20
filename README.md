DevEnvConfig
==========
存在个人开发环境的一些核心配置，包括github配置，bash配置, vim配置, python配置，c++配置等。

# github配置
管理ssh私钥
```
sshkey-gen
eval `ssh-agent`
ssh-add path_of_private_key
# add publickey to github
# add eval and ssh-add to bashrc
```

# vim配置
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vimrc
vim ~/.vimrc
:source %
:PluginInstall
cp templates/* to ~/.vim/bundle/vim-templates/templates
# install YouCompleteMe as githubInstruction
```

