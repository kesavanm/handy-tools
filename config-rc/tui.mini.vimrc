"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   auth: kesavan muthuvel
"   bugs: hi@kesavan.info
"   date: 2021-07-01 
"   *****************************
"    ✔  1 basic .vimrc
"    ✔  2 DejaVuSansMono font & ui
"    ✔  3 restore previous session & layout [tab,windows]
"    ✔  4 tmp dir to ~
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"key stuff

" smile 
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
filetype on

set fileencodings=ucs-bom,utf8,prc
set paste

filetype on
filetype plugin on
filetype indent on

set directory=~/.vim/tmp
set laststatus=2            	" always a status line
set undofile 
set undodir=~/.vim/undo-dir	" TIME-TRAVEL 

" stop insert asap
autocmd VimEnter * stopinsert
set noinsertmode
" set ambw=double	" TODO Has conflict with Powerline(Breaks the line)
			" STATUS BAR - some weird chars
" ___________session #3 
call plug#begin('~/.vim/plugged')
	Plug 'johngrib/vim-game-snake' 		" 90kids game
	Plug 'johngrib/vim-game-code-break'

	Plug 'kshenoy/vim-signature'		" marks +signs
	Plug 'mattesgroeger/vim-bookmarks'	" bookmarks wow!

	Plug 'junegunn/vim-peekaboo' 		" registers
	Plug 'vim-airline/vim-airline'		" strawberry over vanilla	
	Plug 'vim-airline/vim-airline-themes'
	Plug 'RRethy/vim-illuminate' 		" illuminate the variables
	Plug 'mbbill/undotree'			" travel time	
	Plug 'jeetsukumaran/vim-buffersaurus'	" lets grep the needle 	
	Plug 'preservim/nerdtree'		" NerdTree
	Plug 'ryanoasis/vim-devicons'		" NerdTree icons
	Plug 'ctrlpvim/ctrlp.vim'		" CtrlP the files
	Plug 'junegunn/fzf.vim'			" FzF <3 vim
	Plug 'junegunn/fzf',{ 'do': { -> fzf#install() } } " FzF <3 vim

	" phpcd - intelligent/smart PHP complete daemon
	Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

	" optional stuff to explore	
	Plug 'sotte/presenting.vim'		" run the show	
	Plug 'altercation/vim-colors-solarized'	" bring more themes	
"	Plug 'fneu/breezy'
	Plug 'dracula/vim'
	Plug 'mhinz/vim-grepper'		
"	Plug 'vim-vdebug/vdebug'
"	Plug 'kvngvikram/rightclick-macros'	" Friendly mouse
						" irritates INS w/ left click
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
"set guifont=DejaVu\ Sans\ Mono:h9	" for native terminal
					" for PuTTY DejaVuSansMonoForPowerline
					" DejaVuSansMonoNerdFontCompleteMono
"set background=dark
"set termguicolors			" DANGER, this kills my term

"tab ball				" tabs over buffer view

if exists(":AirlineRefresh")
:AirlineRefresh
endif

"let g:airline_theme='breezy'    " gruvbox simple seagull
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
"TABLINE:
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = 'tabs'       
let g:airline#extensions#tabline#buffers_label = 'buffers'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_nr = 1	" show tabpage#
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tagbar#enabled =1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1	" show buffer_id (indx)	
let g:airline#extensions#tabline#buffer_nr_format = '%s:'   "buffer format
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'

set shortmess+=F		" dont ask me can I open multi files 

" Shortcuts

" buffer navigation
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev!<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext!<CR>
noremap <silent> <S-S> :Files<CR>

" Normal No Re Map
nnoremap <F3> :Bsgrep

"autocmd BufWinEnter * silent NERDTreeMirror	" keep the layout
	
"set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Install font from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
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

"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1	" show buffer_id (indx)	
"let g:airline#extensions#tabline#buffer_nr_format = '%s:'   "buffer format
"let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnamemod = ':p:.'



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

highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=23


let mapleader = "\<Space>"

noremap <silent> <Leader>n :NERDTreeToggle<CR>
set omnifunc=syntaxcomplete#Complete
autocmd  FileType  php setlocal omnifunc=phpcomplete#CompletePHP


let g:bookmark_sign = '♥'
"let g:bookmark_highlight_lines = 1
