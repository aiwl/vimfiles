" --- Plugins ---------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" --- General settings ------------------------------------------------------
" Note, this needs to go after the plugins. Maybe because of Plug?
syntax on

colorscheme gruvbox
set background=dark

set noerrorbells
set noswapfile

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set nu

" Don't auto indent for C++ namespaces
set cino=N-s

set guifont=consolas:h10
set guioptions-=m
set guioptions-=T
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Set the 80 column guide
let &colorcolumn=join(range(80,999),",")

" --- Key mappings ----------------------------------------------------------

" Quicker way to going back to NORMAL mode, without having to reach
" the Esc key.
inoremap jk <Esc>

" Open files, finding files, save & quit
noremap <C-o> :o.<CR>
noremap <C-s> :w<CR>
noremap <C-q> :q<CR>

" Scrolling
map <C-k> 5k
map <C-j> 5j

" Hardmode: do not allow arrow keys for navigation.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Remove all trailing whitespace characters
nnoremap <Leader>r :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:w

