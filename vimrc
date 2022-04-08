" --- Plugins ---------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'cdelledonne/vim-cmake'
call plug#end()

" --- General settings ------------------------------------------------------
" Note, this needs to go after the plugins. Maybe because of Plug?
syntax on

set guifont=DinaRemaster:h16
set noantialias

colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
let g:airline_section_c = '%t'


set backspace=2
set noerrorbells
set visualbell
set noswapfile
set ruler
set laststatus=2

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

" --- Key mappings ----------------------------------------------------------

" Map leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

"
map <Leader> <Plug>(easymotion-prefix)

" Quicker way to going back to NORMAL mode, without having to reach
" the Esc key.
inoremap jk <Esc>

" Open files, finding files, save & quit
noremap <C-o> :o.<CR>
noremap <C-s> :w<CR>
noremap <C-q> :q<CR>
noremap <C-f> :GFiles<CR>

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
