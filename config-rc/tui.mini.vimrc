"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   eVim/gVim - mini .vimrc setup
"   *****************************
"    ✔  1 basic .vimrc
"    ✔  2 DejaVuSansMono font & ui
"    ✔  3 restore previous session & layout [tab,windows]
"    ✔  4 tmp dir to ~
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"key stuff

" ___________session #1 
set number

" ___________session #2 
set nocompatible		" use vim defaults (much better!)
syntax on 			" turning on syntax
set history=500
set bs=2                    	" allow backspacing in insert mode

"search
set hlsearch
set incsearch
set ignorecase
set smartcase

"file encoding & type def
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set paste

filetype on
filetype plugin on
filetype indent on

set directory=~/.vim/tmp
set laststatus=2            	" always a status line

" stop insert asap
autocmd VimEnter * stopinsert
set noinsertmode

" ___________session #3 

call plug#begin('~/.vim/plugged')
	Plug 'johngrib/vim-game-snake' 		" 90kids game
	Plug 'johngrib/vim-game-code-break'
	Plug 'kshenoy/vim-signature'		" marks +signs
	Plug 'junegunn/vim-peekaboo' 		" registers
	Plug 'vim-airline/vim-airline'		" strawberry over vanilla	
	Plug 'vim-airline/vim-airline-themes'
	Plug 'RRethy/vim-illuminate' 		" illuminate the variables
	Plug 'mbbill/undotree'			" travel time	
	Plug 'jeetsukumaran/vim-buffersaurus'	" lets grep the needle 	

	" optional stuff to explore	
	Plug 'sotte/presenting.vim'		" run the show	
	Plug 'altercation/vim-colors-solarized'	" bring more themes	
	Plug 'fneu/breezy'
	Plug 'dracula/vim'
	Plug 'mhinz/vim-grepper'		
call plug#end()

" ___________session #4 

set mouse=a				" set mouse automatic; vim♡mouse
set ttymouse=sgr			" use for scrolling too; xterm[2]

"impressing ui
set t_Co=256				" IMP: more colors, saved my life
syntax enable
colorscheme desert			" others: desert solarized breezy 
"set cursorline 			" Don't make your Vim SLOW
set colorcolumn=80			" never cross border
set guifont=DejaVu\ Sans\ Mono:h9	" for native terminal
					" for PuTTY DejaVuSansMonoForPowerline

"set background=dark
"set termguicolors			" DANGER, this kills my term


"tab ball				" tabs over buffer view

"TABLINE:

if exists(":AirlineRefresh")
:AirlineRefresh
endif

let g:airline_powerline_fonts = 1                                                                                                         
let g:airline_section_b = '%{getcwd()}' 	" display CWD in statusline                                                

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show =1          "numbers in list
let g:airline#extensions#tabline#buffer_nr_format = '%s:'   "buffer format
let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnamemod = ':p:.'


"let g:airline#extensions#tabline#buffers_label = 'buffers'
"let g:airline#extensions#tabline#tabs_label = 'tabs'
"let g:airline_theme='breezy'			" also: gruvbox simple seagull
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#show_tab_count = 1
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#tab_min_count = 1
"let g:airline#extensions#tabline#show_splits = 1
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#show_tab_type = 1
"let g:airline#extensions#tagbar#enabled =1


" TIME-TRAVEL
" https://stackoverflow.com/questions/5700389/using-vims-persistent-undo#22676189
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


" `GNU/screen` options
if &term =~ '256color'
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color GNU screen.
    set t_ut=
endif

set shortmess+=F



"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>


