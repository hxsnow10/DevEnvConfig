DevEnvConfig
==========
存在个人开发环境的一些核心配置，包括github配置，bash配置, vim配置, python配置，c++配置等。

# github配置
管理ssh私钥
```
ssh-keygen
eval `ssh-agent`
ssh-add path_of_private_key
# add publickey to github
# add eval and ssh-add to bashrc
git config --global user.email "xiahahaha01@gmail.com"
git config --global user.name "hxsnow10"
```

# vim配置
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \ curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ln vimrc ~/.vimrc
vim ~/.vimrc
:source %
:PluginInstall
cp vim-templates/* to ~/.vim/bundle/vim-templates/templates
# YouComplteteMe requires Vim 9.1.0016+.如果需要就要升级；codeium依赖9.0.0185+
```

vim 升级,可以升级到库里提前编译好的版本9.0，没找到9.1的
```
add-apt-repository -r ppa:jonathonf/vim
apt update
apt install vim
```

编译安装最新vim
```
git clone https://github.com/vim/vim.git
cd vim
# make distclean
# compile vim with python support
./configure --with-features=huge --enable-python3interp --enable-fail-if-missing --with-python3-command=/usr/bin/python3 --with-python3-config-dir=/usr/lib/python3.10/config-3.10-x86_64-linux-gnu
make -j8
make install
```

启动ycm
```
cd ~/.vim/bundle/YouCompleteMe/
python3 install.py
# python3 install.py --force-sudo
```

