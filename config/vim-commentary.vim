" Plugin vim-commentary
" 修改注释风格
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType c,cpp set commentstring=//\ %s
" 自定义类型
autocmd BufRead,BufNewFile *.cfg set filetype=core_cfg
autocmd FileType core_cfg set commentstring=#\ %s
