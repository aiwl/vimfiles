syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set nu

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
call plug#end()

" Note, this needs to go after the plugins. Maybe because of Plug?
colorscheme gruvbox
set background=dark
set guifont="Source Code Pro for Powerline"

" Key mapping
inoremap jk <Esc>
