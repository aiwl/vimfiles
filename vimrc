" --- Plugins ---------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'nlknguyen/papercolor-theme'
Plug 'hzchirs/vim-material'
Plug 'sainnhe/everforest'
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" --- General settings ------------------------------------------------------
" Note, this needs to go after the plugins. Maybe because of Plug?
syntax on

set guifont=Source\ Code\ Pro\ for\ Powerline:h10
"set guifont=Fira\ Mono\ for\ Powerline:h11
"set noantialias

colorscheme everforest
set background=dark
let g:airline_theme='everforest'
let g:airline_section_c = '%t %m '
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set backspace=2
set noerrorbells
set visualbell
set noswapfile
set ruler
set laststatus=2
set statusline=[%n]\ %<%f%h%m

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set nu

set splitbelow

" Don't auto indent for C++ namespaces
set cino=N-s

" Makes the working directory always the same as file we are editing.
set autochdir

set guioptions-=m
set guioptions-=T
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Set the 80 column guide
let &colorcolumn=join(range(80,999),",")

set encoding=utf-8
set fileencoding=utf-8

" Set cursor settings
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Remove the tilde
highlight EndOfBuffer ctermfg=bg ctermbg=bg
highlight EndOfBuffer guifg=bg guibg=bg

set fillchars+=vert:\|
hi vertsplit guifg=bg guibg=bg ctermfg=bg ctermbg=bg


" --- Key mappings ----------------------------------------------------------

" Map leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" Quicker way to going back to NORMAL mode without having to reach
" the Esc key.
inoremap jk <Esc>

" Splitting
noremap <Leader>v :vsplit<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Open files, finding files, save & quit
noremap <leader>o :o.<CR>
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap ff :GFiles<CR>

" Scrolling
map <C-k> 5k
map <C-j> 5j

" Hardmode: do not allow arrow keys for navigation.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Pointer dereferencing shortcut.
inoremap ;; ->

" Substitutions and finding
noremap <Leader>s :s//gc<left><left><left>
noremap <Leader>S :%s//gc<left><left><left>

" Remove all trailing whitespace characters
nnoremap <Leader>r :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:w<CR>

" Map autocompletion to tab
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" --- CoC configuration ----------------------------------------------------

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use Ctrl+Space to trigger completion.
" NOTE: This does not seem to work on all platforms/terminals.
"       Use another shortcut in that case, e.g. Ctrl+k.
inoremap <silent><expr> <C-k> coc#refresh()
