"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   eVim/gVim - mini .vimrc setup
"   auth: kesavan muthuvel
"   bugs: hi@kesavan.info
"   date: 2021-09-07 
"   *****************************
"    ✔  1 basic .vimrc
"    ✔  2 DejaVuSansMono font & ui
"    ✔  3 layout [tab,windows]
"    ✔  4 tmp dirs
"    ✔  5 restore previous session 
"
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
syntax enable

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
set undofile 
set undodir=~/.vim/undo-dir	" TIME-TRAVEL 

" stop insert asap
autocmd VimEnter * stopinsert
set noinsertmode

" ___________session #3 
call plug#begin('~/.vim/plugged')
    Plug 'johngrib/vim-game-snake'          " 90kids game
    Plug 'johngrib/vim-game-code-break'
    Plug 'kshenoy/vim-signature'            " marks +signs
    Plug 'mattesgroeger/vim-bookmarks'      " bookmarks ♥ wow!
    Plug 'junegunn/vim-peekaboo'            " registers
    Plug 'vim-airline/vim-airline'          " strawberry over vanilla
    Plug 'vim-airline/vim-airline-themes'
    Plug 'RRethy/vim-illuminate'            " illuminate the variables
    Plug 'mbbill/undotree'                  " travel time
    Plug 'jeetsukumaran/vim-buffersaurus'   " lets grep the needle
    Plug 'preservim/nerdtree'               " NerdTree
    Plug 'ryanoasis/vim-devicons'           " NerdTree icons
    Plug 'ctrlpvim/ctrlp.vim'               " CtrlP the files
    Plug 'junegunn/fzf.vim'                 " FzF <3 vim
    Plug 'junegunn/fzf',{ 'do': { -> fzf#install() } } " FzF <3 vim

	"	 Plug 'wfxr/minimap.vim'

    " optional stuff to explore
    Plug 'sotte/presenting.vim'             " run the show
    Plug 'altercation/vim-colors-solarized' " bring more themes
    Plug 'fneu/breezy'
    Plug 'dracula/vim'
    Plug 'mhinz/vim-grepper'
call plug#end()

" ___________session #4 
set mouse=a				" set mouse automatic; vim♡mouse
set ttymouse=sgr			" use for scrolling too; xterm[2]

"impressing ui
set t_Co=256				" IMP: more colors, saved my life
tab ball				" tabs over buffer view

colorscheme desert			" try others: desert solarized breezy 
"set cursorline 			" don't make your vim SLOW
set colorcolumn=80			" never cross border
"set guifont=DejaVu\ Sans\ Mono:h9	" for native terminal
					" for PuTTY DejaVuSansMonoForPowerline
					" DejaVuSansMonoNerdFontCompleteMono
"key stuff
set background=dark
set switchbuf=useopen,usetab


"let g:minimap_width = 10
"let g:minimap_auto_start = 1
"let g:minimap_auto_start_win_enter = 1



" Activate all the handy Windows key-bindings we're used to.
" source $VIMRUNTIME/mswin.vim



" ---- better vimdiff ; make your eyes happy :) ---------
highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=23
 
" ----------------- custom shortcuts ---------------------------
" buffer navigation
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev!<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext!<CR>
noremap <silent> <S-S> :Files<CR>

" Normal No Re Map
nnoremap <F3> :Bsgrep
let mapleader = "\<Space>"
noremap <silent> <Leader>n :NERDTreeToggle<CR>

set omnifunc=syntaxcomplete#Complete

let g:bookmark_sign = '♥'
"hi ColorColumn ctermbg=lightcyan guibg=blue
hi ColorColumn ctermbg=lightcyan guibg=blue

set tabpagemax=99
set hidden      "disable E37: No write since last change when buffer move (:e )
autocmd BufWritePost * if &diff | diffupdate | endif "source .vimrc after save


" Activate all the handy Windows key-bindings we're used to.
" source $VIMRUNTIME/mswin.vim
"behave mswin
set tabpagemax=99
set hidden      "disable E37: No write since last change when buffer move (:e )
autocmd BufWritePost * if &diff | diffupdate | endif "source .vimrc after save

"preserve & restore session
autocmd! VimLeave * mksession!			"Automatically save the session when leaving Vim
autocmd! VimEnter * source ~/Session.vim	"Automatically load the session when entering vim
autocmd VimLeavePre * mksession!


" GUI options that need to be set here first
" Remove extra, useless button bar.
if has("gui_running")
	set guioptions+=m  	"menubar
      " set guioptions+=T	"Toolbar
      " set guioptions=egrLtmT  " complete win style tabline
	set guitablabel=%N\ %t\ %M
	set lines=999 columns=999	"full screen 
endif


"http://inside.github.io/vim-presentation - VIM learning 
"au FileType rst let b:presenting_slide_separator = '\v(^|\n)\~{4,}'
"vDebug
"set pythonthreedll=C:\Users\kmuthuvel\AppData\Local\Programs\Python\Python38\python38.dll
"set pythonthreehome=C:\Users\kmuthuvel\AppData\Local\Programs\Python\Python38

"let g:vdebug_options = {
"\   'path_maps': {
"\       "/mnt/c/Users/kmuthuvel/workspace/sonar2":"C:\\Users\\kmuthuvel\\workspace\\sonar2",
"\   },
"\}

"set statusline=%<%f%n%m%r%y%=%b\ 0x%B\ \ %l,%c%V\ %P

" Status Line {
       set laststatus=2                             " always show statusbar
       set statusline=
       set statusline+=%-10.3n\                     " buffer number
       set statusline+=%f\                          " filename
       set statusline+=%h%m%r%w                     " status flags
       set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
       set statusline+=%=                           " right align remainder
       set statusline+=0x%-8B                       " character value
       set statusline+=%-14(%l,%c%V%)               " line, character
       set statusline+=%<%P                         " file position
"}


"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END
"
"autocmd BufWinEnter * silent :Vexplore
" 
"autocmd VimEnter * :tabnew

"Plugin stuff
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

" 8/25/2014
"execute pathogen#infect()
"filetype plugin indent on
"
"
"set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
"
"nnoremap n nzz

nnoremap <leader>b :ls<CR>:b<Space>
if exists(":AirlineRefresh")
:AirlineRefresh
endif

let g:airline_theme='breezy'    " gruvbox simple seagull deus wombat
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

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1	" show buffer_id (indx)	

let g:airline#extensions#tabline#buffer_nr_format = '%s:'   "buffer format
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'


function XMLPrint()		" pretty-print xml 
	:se syntax=xml ft=xml	" set syntax & filetype 
	:%s/></>\r</g		" breakdown the newlines
				" next indent(=) the file(%) in normal way
	:execute "%norm! =$"
endfunction

" Activate all the handy Windows key-bindings we're used to.
" source $VIMRUNTIME/mswin.vim

set tabpagemax=99
set hidden	"disable E37: No write since last change when buffer move (:e )	
" behave mswin

