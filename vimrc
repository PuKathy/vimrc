set nocompatible
" copy-paste时，前后出现0~ ~1问题
set t_BE="\e[?2004l"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 安装plug插件
" ~需要用expand扩展路径
if !filereadable(expand("~/.vim/autoload/plug.vim"))
    echo "installing vim-plug ..."
    !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
    Plug 'Chiel92/vim-autoformat'
    Plug 'kshenoy/vim-signature'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-commentary'
    " Plug 'bronson/vim-trailing-whitespace'
    Plug 'altercation/vim-colors-solarized'
    Plug 'majutsushi/tagbar'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-scripts/phd'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'ludovicchabant/vim-gutentags'
    " 依赖python, vim --version | grep python
    " Plug 'Yggdroot/LeaderF'
    " 依赖ack等程序
    " mac: brew install ack
    " linux: curl https://beyondgrep.com/ack-v3.3.1 > ~/bin/ack && chmod 071010 ~/bin/ack
    " let g:ctrlsf_ackprg=~/tool/module/tool/ack-v3.3.1_release/bin/ack;
    Plug 'dyng/ctrlsf.vim'
    " Plug 'jiangmiao/auto-pairs'
    " c语言lsp: brew install llvm
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键的前缀，即<Leader>
let mapleader=";"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-trailing-whitespace
" 去掉末尾空格
map <leader><space> :FixWhitespace<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 默认打开bookmarks
" let NERDTreeShowBookmarks=1
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=30
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" Start NERDTree
" autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin tagbar
" autocmd VimEnter * nested :TagbarOpen
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
"tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_autofocus=1
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_right=1
" 设置标签子窗口的宽度
let tagbar_width=32
" 设置标签不排序，默认排序
let tagbar_sort=0
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 开启自动预览 [随着光标在标签上的移动，顶部会出现一个实时的预览窗口]
let g:tagbar_autopreview=0
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-commentary
" 修改注释风格
autocmd FileType cmake setlocal commentstring=#\ %s
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType c,cpp set commentstring=//\ %s
autocmd FileType core_cfg set commentstring=#\ %s

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-gutentags
" reference: https://zhuanlan.zhihu.com/p/43671939
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置 ctags 的参数
" --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q
let g:gutentags_ctags_extra_args = ['--fields=+iaSl', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
if has('mac')
    " 会调用~/.vim/colors路径下
    " 从solarized.git/vim-colors-solarized/colors/solarized.vim
    " set background=dark
    " colorscheme solarized
endif
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized2106'

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
" set cursorcolumn

set showcmd
set showmode
set wrap
set number
" 注释掉paste，否则inoremap ( ()不起效，coc.nvim不起效
" set paste

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

" 设置新窗口默认位置
set splitbelow
set splitright


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimgdb 目前的patch只支持到了vim7.4
" helptags ~/.vim/vimgdb/vimgdb-for-vim7.4/vimgdb_runtime/doc
" run vimgdb/vimgdb-for-vim7.4/vimgdb_runtime/macros/gdb_mappings.vim
" set previewheight=100
" set splitright

" Termdebug vim8.1自带的功能
" 加载termdebug plug
" packadd termdebug
" 默认水平分割，添加这个参数竖向分隔窗口
" let g:termdebug_wide=10


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin ctrlsfj
nmap <Leader>f :CtrlSF<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Startify
let g:startify_custom_header = ['Hello, this is Startify']
let g:startify_custom_footer = []
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_files_number = 20
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.bash_profile' ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件打开，自动跳到上次浏览位置
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" vimrc修改立马生效
autocmd! bufwritepost $HOME/.vimrc source %
nmap <Leader>rc :e $HOME/.vimrc<CR>

noremap <F3> :Autoformat<CR>:w<CR>
" let g:autoformat_verbosemode=1
let g:formatdef_allman = '"astyle --style=google --indent-classes --break-blocks --pad-oper --pad-comma --pad-header --unpad-paren --align-pointer=type --align-reference=type --break-one-line-headers --add-braces --attach-return-type --max-code-length=200 --break-after-logical"'
let g:formatters_cpp = ['allman']
let g:formatters_c = ['allman']
" let g:formatdef_my = '"clang-format -style=file"'
" let g:formatdef_my = '"clang-format -style=linux"'
" let g:formatters_cpp = ['my']
" let g:formatters_c = ['my']

" colorscheme https://www.jianshu.com/p/77dd73db3f89
colorscheme elflord

nmap <Leader>r+ :resize +10<CR>
nmap <Leader>r- :resize -10<CR>
nmap <Leader>vr+ :vertical resize -10<CR>
nmap <Leader>vr- :vertical resize +10<CR>

" opening in a new window (split):
nnoremap gf <C-W>f
vnoremap gf <C-W>f
" opening in a new window (vertical split):
nnoremap gfv <C-W>vgf
vnoremap gfv <C-W>vgf
" opening in a new tab:
nnoremap gft <C-W>gf
vnoremap gft <C-W>gf

fu! SaveSess()
    execute 'mksession! ~/.my.session.vim'
    execute 'wviminfo! ~/.my.session.viminfo'
endfunction

fu! RestoreSess()
    execute 'mksession! ~/.my.session.vim'
    execute 'wviminfo! ~/.my.session.viminfo'
endfunction

" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
" map <leader>ss :mksession! ~/.my.session.vim<cr> :wviminfo! ~/my.session.viminfo<cr>
map <leader>ss :call SaveSess() <cr>
" 恢复快捷键
map <leader>rs :source ~/.my.session.vim<cr> :rviminfo! ~/my.session.viminfo<cr>
" map <leader>rs :call RestoreSess() <cr>


autocmd VimLeave * call SaveSess()
" autocmd VimEnter * call RestoreSess()
