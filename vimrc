sourc ~/.vim/config/plugin.vim

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

source ~/.vim/config/vim-trailing-whitespace.vim
source ~/.vim/config/nerdtree.vim
source ~/.vim/config/ctags_tagbar_indexer.vim
source ~/.vim/config/vim-commentary.vim

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 自适应不同语言的智能缩进
filetype indent on

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 开启实时搜索功能
set incsearch
" 高亮显示搜索结果
set hlsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu


" 需要终端支持对应的配色方案
" 配色方案
set background=dark
if !has('unix')
    colorscheme solarized
endif
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
set cursorcolumn

set showcmd
set showmode
set nowrap
set number
set paste

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


" 保存的命令行历史记录数目，默认20
set history=200
" 禁止是用方向键盘
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" insert模式下支持退格键删除
set backspace=indent,eol,start

" vim剪切板和系统剪切板公用
" vim --version | grep clipboard
" +y   复制到系统剪贴板
" +p   粘贴
" +gp  粘贴并且移动光标到粘贴内容后
vmap <leader>c "+y
nmap <leader>v "+gp

" vimgdb
helptags ~/.vim/vimgdb/vimgdb-for-vim7.4/vimgdb_runtime/doc
run vimgdb/vimgdb-for-vim7.4/vimgdb_runtime/macros/gdb_mappings.vim
set previewheight=50
set splitright

