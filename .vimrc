set incsearch
set ignorecase
set smartcase

set nu

" turning on syntax
syntax on

" GUI options that need to be set here first
" Remove exta, useless button bar.
set guioptions-=T
set guioptions+=t

set encoding=utf-8

set nocompatible            " Use Vim defaults (much better!)
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
