DevEnvConfig
==========
存在个人开发环境的一些核心配置，包括github配置，bash配置, vim配置, python配置，c++配置等。

# 镜像
以下所有配置都可以存储在镜像里。镜像的管理跟平台有关。

# 服务器公钥配置
方便你从本地登录服务器；
当然你可能在云服务器平台可以统一配公钥就省略了
```
ssh-copy-id -i ~/.ssh/id_rsa.pub 用户名@IP
ssh -v 用户名@IP  # 验证
```

# github配置
方便你从服务器交互github。这里有2种方式，
1）把你本地的github私钥上传到服务器，公钥已经在github上了  
2）在服务器上重新生成份私钥、公钥
1更方便，但存在安全隐患，2稍麻烦。

```
ssh-copy-id -i ~/.ssh/id_rsa 用户名@IP
# login 
eval `ssh-agent`
ssh-add path_of_private_key
# add eval and ssh-add to bashrc
```

方法2: `bash setup_github.sh`

```
git config --global user.email "xiahahaha01@gmail.com"
git config --global user.name "xiahong"
```

# vim配置
有点麻烦
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

copilot, 可用
```
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Download and install Node.js:
nvm install 23

# Verify the Node.js version:
node -v # Should print "v23.6.0".
nvm current # Should print "v23.6.0".

# Verify npm version:
npm -v # Should print "10.9.2".

# vim and :Copilot setup
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

# C++开发环境




# Python开发环境



# AI相关环境

