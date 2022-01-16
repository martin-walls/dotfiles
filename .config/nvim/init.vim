" vim:foldmethod=marker

" set <leader> to <space>
let mapleader=" "

" GENERAL SETTINGS
" {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set splitright
set splitbelow
set title
set titlestring=%t%m
set scrolloff=6
set sidescrolloff=8
set autowrite
set autowriteall
set clipboard=unnamedplus
" vertical window separator between splits
set fillchars+=vert:┃
" show whitespace: tabs, trailing spaces
set list
set listchars=tab:»-,trail:·
" tab completion
set wildmode=longest,list,full
" don't wrap in middle of word
set linebreak
" mouse support
set mouse=a

set foldmethod=manual
set foldcolumn=2
set fillchars+=fold:\ ,foldopen:┍,foldsep:│
set foldtext=gitgutter#fold#foldtext()
" minimum number of lines for fastfold to be enabled
let g:fastfold_minlines=0


" }}}

" COLORS
set termguicolors
syntax on
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1

