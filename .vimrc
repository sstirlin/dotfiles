" Be sure to clone vundle from github
" then run :PluginInstall (or :PluginUpdate as appropriate)

" Vundle package management
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'


" packages that I like

" python code completion
Plugin 'davidhalter/jedi-vim'

" close brackets, please
Plugin 'jiangmiao/auto-pairs'



filetype plugin indent on  " required by Vundle


" close Omni-Completion tip window when leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


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
nmap <silent> <Leader>wk <C-w>k
nmap <silent> <Leader>wj <C-w>j
nmap <silent> <Leader>wh <C-w>h
nmap <silent> <Leader>wl <C-w>l
nmap <silent> <Leader>wK <C-w>K
nmap <silent> <Leader>wJ <C-w>J
nmap <silent> <Leader>wH <C-w>H
nmap <silent> <Leader>wL <C-w>L


" map vs and sp to | and -
nmap <silent> <Leader>w\| :exe "vs"<CR>
nmap <silent> <Leader>w- :exe "sp"<CR>


" remap window resize to leader+arrows
nmap <silent> <Leader>w<Up> :exe "resize -5"<CR>
nmap <silent> <Leader>w<Down> :exe "resize +5"<CR>
nmap <silent> <Leader>w<Left> :exe "vertical resize -5"<CR>
nmap <silent> <Leader>w<Right> :exe "vertical resize +5"<CR>
if bufwinnr(1)  " make repeatable 
    map <Up> <Leader>w<Up>
    map <Down> <Leader>w<Down>
    map <Left> <Leader>w<Left>
    map <Right> <Leader>w<Right>
endif


" want to edit other files without saving the current one first
set hidden


" remap pageup pagedown to leader keys
nmap <silent> <Leader>f <C-f>
nmap <silent> <Leader>b <C-b>


" enable wildmenu
set wildmenu
set wildmode=longest:full,full

