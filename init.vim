lua require('plugins')
set number

set encoding=UTF-8
set list
set lcs+=space:.
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus
set foldenable
set foldmethod=indent

"Set spaces to 2 for lua, html files
autocmd Filetype lua setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
