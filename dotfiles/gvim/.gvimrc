"https://abbeyworkshop.com/howto/osx/osxVim/index.html
" syntax highlighting on
syntax on

" auto indent
set ai

" show line numbers
set nu

" tabs should be four spaces
set ts=4

" do not put a cr at the end of the file. this will result in headers sent if you do web programming
set binary noeol

" highlighting search results is annoying
set nohlsearch

" show matching brackets
set showmatch

" make that backspace key work the way it should
set backspace=indent,eol,start

" OPTIONAL
" show whitespace at end of lines
highlight WhitespaceEOL ctermbg=lightgray guibg=lightgray
match WhitespaceEOL /s+$/

" make the last line where the status is two lines deep so you can see status always
set laststatus=2

" vi compatible is LAME
set nocompatible

" no bell, please
set vb

" a better font...

" set the screen width and height

"http://vim.wikia.com/wiki/Open_every_buffer_in_its_own_tabpage
" To open each buffer in its own tabpage, add this to your vimrc: 
:au BufAdd,BufNewFile * nested tab sball
map     <C-N>       :!gvim &<CR><CR>
map     <C-W>       :confirm bdelete<CR>
