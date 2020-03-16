" Plugin vim-commentary
" 为python和shell等添加注释
autocmd FileType python,shell set commentstring=#\ %s
" 修改注释风格
autocmd FileType c,cpp set commentstring=//\ %s
