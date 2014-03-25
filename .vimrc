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
set tabstop=8
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

