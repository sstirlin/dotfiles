" Be sure to clone vundle from github
" then run :PluginInstall (or :PluginUpdate as appropriate)

" Vundle package management
set nocompatible              " be iMproved, required
filetype off                  " Vundle needs this off right now

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" packages that I like

" python code completion
Plugin 'davidhalter/jedi-vim'

" ipython integration
Plugin 'ivanov/vim-ipython'
source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

" automatically surround text with matching delimiters, e.g. S" surrounds
" visual selection with quotes
Plugin 'tpope/vim-surround'

"json viewer
Plugin 'elzr/vim-json'


filetype plugin indent on  " turn this back on (done with Vundle for now)

" close Omni-Completion tip window when leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" enable matchit plugin (jump to matching keywords, e.g. begin/end, using the % command)
runtime macros/matchit.vim

syntax on


" tabs should ALWAYS be 4 spaces
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4


" this enables visual wrapping
set wrap
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0


" jk mapped to esc
imap jk <Esc>


" shift-tab should be the backtab (in both normal and insert mode)
set backspace=indent,eol,start
inoremap <s-tab> <c-d>
nmap <s-tab> <<


" use spacebar as leader key
let mapleader = "\<Space>"


" remap window stuff away from nasty cntrl key.  Use Leader instead
"nmap <silent> <Leader>wk <C-w>k
"nmap <silent> <Leader>wj <C-w>j
"nmap <silent> <Leader>wh <C-w>h
"nmap <silent> <Leader>wl <C-w>l
"nmap <silent> <Leader>wK <C-w>K
"nmap <silent> <Leader>wJ <C-w>J
"nmap <silent> <Leader>wH <C-w>H
"nmap <silent> <Leader>wL <C-w>L
"nmap <silent> <Leader>wq <C-w>q
"nmap <silent> <Leader>wo <C-w>o
"nmap <silent> <Leader>wc <C-w>c


" map vs and sp to | and -
nmap <silent> <C-w>\| :exe "vs"<CR>
nmap <silent> <C-w>- :exe "sp"<CR>
"nmap <silent> <Leader>w\| :exe "vs"<CR>
"nmap <silent> <Leader>w- :exe "sp"<CR>


" remap window resize to Ctrl-w+arrows
nmap <silent> <C-w><Up> :exe "resize -5"<CR>
nmap <silent> <C-w><Down> :exe "resize +5"<CR>
nmap <silent> <C-w><Left> :exe "vertical resize -5"<CR>
nmap <silent> <C-w><Right> :exe "vertical resize +5"<CR>
if bufwinnr(1)  " make repeatable 
    map <Up> <C-w><Up>
    map <Down> <C-w><Down>
    map <Left> <C-w><Left>
    map <Right> <C-w><Right>
endif


" for faster switching between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>


" want to edit other files without saving the current one first
set hidden


" enable wildmenu
set wildmenu
set wildmode=longest:full,full


" %% expands to current path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' 


" faster way to navigate buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>


" store temp files in /tmp PLEASE
set backupdir=/tmp
set directory=/tmp


" netrw NEEDS to stop file browsing in a split
let g:netrw_browse_split = 0

" turn on syntax code folding
set foldmethod=syntax

