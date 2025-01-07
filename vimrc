set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" 自动补齐
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 展示文件目录
Plugin 'scrooloose/nerdtree'
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-m> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" 在最底下增加一行信息，显示文件名等信息
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" codeium
Plugin 'Exafunction/codeium.vim'
let g:codeium_enabled = v:true
let g:codeium_filetypes_disabled_by_default = v:true
let g:codeium_filetypes = {
    \ "rust": v:true,
    \ "typescript": v:true,
    \ "py": v:true,
    \ }
" 有问题跑不起来

" vim模板
Plugin 'tibabit/vim-templates'
let g:tmpl_search_paths = ['~/.vim/templates']
let g:tmpl_author = 'xiahong'
let g:tmpl_author_name = 'xiahong'
let g:tmpl_author_email = 'xiahahaha01@gmail.com'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" Plugin 'tmhedberg/SimpylFold'
" let g:SimpylFold_docstring_preview=1
set nofoldenable " disable fold 

" python语言检查与高亮加强
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let g:syntastic_python_checkers = ['flake8', 'pylint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_args = "
    \--variable-rgx=\"^[a-z][a-z0-9]*((_[a-z0-9]+)*)?$\"
    \ --argument-rgx=\"^[a-z][a-z0-9]*((_[a-z0-9]+)*)?$\"
    \ --const-rgx=\"[a-zA-Z_][a-zA-Z0-9_]{2,30}$\""
" let g:syntastic_python_flake8_args = "--ignore=F841"
let python_highlight_all=1
syntax on

" 使vs 生成的window在右边
set splitright

call vundle#end()            " required
filetype plugin indent on    " required

execute pathogen#infect()

filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
syntax on                   " 自动语法高亮

set showcmd

set number                  " 显示行号

set autoindent              " 自动对齐

set smartindent             " 智能对齐

set cursorline              " 突出显示当前行

set ruler                   " 打开状态栏标尺

set ts=4                    " 设定 tab 长度为 4

"set tabstop=1               " 设定 tab 长度为 4

set clipboard=unnamed

set expandtab               " use space instead of tab

set shiftwidth=4            " 设定 > 命令移动时的宽度为 4

set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格

set nobackup                " 覆盖文件时不备份

set autochdir               " 自动切换当前目录为当前文件所在的目录
let python_highlight_all = 1

filetype plugin indent on   " 开启插件

set backupcopy=yes          " 设置备份时的行为为覆盖

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

set nowrapscan              " 禁止在搜索到文件两端时重新搜索

set incsearch               " 输入搜索内容时就显示搜索结果

set hlsearch                " 搜索时高亮显示被找到的文本

" :au BufNewFile *.py r ~/.vim/templates/tpl.py

" Enable folding; Done by SimplyFold
" set foldmethod=indent
" set foldlevel=2
" set foldnestmax=1
" set foldlevelstart=99
" Enable folding with the spacebar

" 自定义foldtext，但没看到效果
" set foldtext=MyFoldText()
" function MyFoldText()
"   let line = getline(v:foldstart)
"   let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
"   return v:folddashes . sub
" endfunction

" 自定义fold命令
nnoremap <space> zA
vnoremap <space> zf
noremap <F6> :SyntasticCheck<CR> 
noremap <F10> zi
" noremap <C-Space> zR
" noremap <C-space> zM
" za 表示zo or zc
" zR open all; zM close all
" zO open all under the cursor; zC close all under the cursor

" hightlight TODO
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

set ts=4 sw=4
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

