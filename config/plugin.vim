" vundle 环境设置------------------------------------------------
" compatible让vim关闭扩展功能，尽量模拟vi
set nocompatible " be iMproved, required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-commentary'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/phd'
Plugin 'octol/vim-cpp-enhanced-highlight'

" indexer自动调用和更新ctags
" indexer依赖DfrankUtil和vimprj
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'

call vundle#end()
filetype plugin indent on
" vundle 环境设置结束--------------------------------------------

