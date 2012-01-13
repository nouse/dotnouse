set nocompatible          " We're running Vim, not Vi!
filetype off  " required!

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimproc'
Bundle 'ujihisa/neco-ghc'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'godlygeek/tabular'

syntax on
filetype plugin on
filetype indent on " Enable filetype-specific indenting and plugins

runtime! macros/matchit.vim

set bs=2
set statusline=%F%m%r%h%w\ [POS=%4l%4v][%p%%]\ [LEN=%L]

set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

colorscheme default
"set ai
"set si

set showcmd
set hlsearch
set ignorecase
set smartcase

set wildignore=*.png,*.jpg

nnoremap <space> :

imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_disable_auto_complete=1

let g:rubycomplete_buffer_loading=1
