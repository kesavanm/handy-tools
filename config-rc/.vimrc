"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   eVim/gVim - mini .vimrc setup
"   *****************************
"    ✔  1 basic .vimrc
"    ✔  2 DejaVuSansMono font & ui
"    ✔  3 restore previous session & layout [tab,windows]
"    ✔  4 tmp dir to ~
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"impressing ui
colorscheme desert
set guifont=DejaVu\ Sans\ Mono:h9

"preserve & restore session
autocmd! VimLeave * mksession			"Automatically save the session when leaving Vim
autocmd! VimEnter * source ~/Session.vim	"Automatically load the session when entering vim
autocmd VimLeavePre * mksession! 
set directory=~/.vim/tmp

"key stuff
set number
set nocompatible
set nocompatible				" use vim defaults (much better!)
syntax on 					" turning on syntax

"search
set ignorecase
set hlsearch
set incsearch
set ignorecase
set smartcase

"file encoding
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set paste

" GUI options that need to be set here first
" Remove exta, useless button bar.
set guioptions-=T
set guioptions+=t

set bs=2                    " allow backspacing over everything in insert mode

set history=500
set statusline=%<%f%m%r%y%=%b\ 0x%B\ \ %l,%c%V\ %P
set laststatus=2            " always a status line

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
  " colorscheme mycolors
endif

filetype plugin on
filetype indent on

" 8/25/2014 
"execute pathogen#infect()
"filetype plugin indent on
