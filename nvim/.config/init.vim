" vim:foldmethod=marker

" set <leader> to <space>
let mapleader=" "

" ┌──────────────────┐
" │ General settings │
" └──────────────────┘
" {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set splitright
set splitbelow
set title
" set titlestring=\ %t%m
set scrolloff=6
set sidescrolloff=8
set autowrite
set autowriteall
set clipboard=unnamedplus
set cursorline
" vertical window separator between splits
set fillchars+=vert:┃
" show whitespace: tabs, trailing spaces
set list
set listchars=tab:»-,trail:·
" tab completion
set wildmode=longest,list,full
set wildignorecase
" don't wrap in middle of word
set linebreak
" mouse support
set mouse=a

set foldmethod=manual
set foldcolumn=2
set fillchars+=fold:\ ,foldopen:┍,foldsep:│
set foldtext=gitgutter#fold#foldtext()

set spelllang=en

" function so it can be called in ftplugins
function! SetFiletypeTitlestring(icon)
  let &titlestring = a:icon . "\ %t%m"
  set title titlestring
endfunction

call SetFiletypeTitlestring('')

" }}}

" ┌────────┐
" │ Colors │
" └────────┘
" {{{
set termguicolors
syntax on
" let g:onedark_hide_endofbuffer=1
" let g:onedark_terminal_italics=1
let g:one_allow_italics = 1
colorscheme one

" set background=light

" remove background, to respect terminal transparency
" hi Normal ctermbg=NONE guibg=NONE

" }}}

" ┌──────────┐
" │ Mappings │
" └──────────┘
" {{{
" reload init.vim
nnoremap <leader>R :source $MYVIMRC<CR>

" find and replace all occurrences of word under cursor
nnoremap <F6> :%s/\<<C-r><C-w>\>//g<Left><Left>
" general find and replace shortcut
nnoremap S :%s//g<Left><Left>
" search for word under cursor
nnoremap F /<C-r><C-w><CR>

" add undo action per word
inoremap <Space> <Space><C-g>u
inoremap <c-w> <c-g>u<c-w>
inoremap <c-u> <c-g>u<c-u>

" add brackets around visual selection
vnoremap { xi{}<Esc>P
vnoremap ( xi()<Esc>P
vnoremap [ xi[]<Esc>P

" reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" allow gf to edit non-existent files
map gf :edit <cfile><CR>

noremap <silent> <Esc> :let @/=""<CR><Esc>

" }}}

" ┌──────────┐
" │ Movement │
" └──────────┘
" {{{
" move up/down one line as it appears on screen
noremap <Up> gk
noremap <Down> gj
inoremap <Up> <c-o>gk
inoremap <Down> <c-o>gj

" home/end for line as it appears on screen
noremap <Home> g^
noremap <End> g$
inoremap <Home> <c-o>g^
inoremap <End> <c-o>g$

" Window navigation shortcuts
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Move lines up/down (and reindent to match new pos)
nnoremap <A-j> :m.+1<CR>==
nnoremap <A-k> :m.-2<CR>==
inoremap <A-j> <Esc>:m.+1<CR>==gi
inoremap <A-k> <Esc>:m.-2<CR>==gi
vnoremap <A-j> :m'>+1<CR>gv=gv
vnoremap <A-k> :m'<-2<CR>gv=gv
" also using arrow keys
nnoremap <A-Down> :m.+1<CR>==
nnoremap <A-Up> :m.-2<CR>==
inoremap <A-Down> <Esc>:m.+1<CR>==gi
inoremap <A-Up> <Esc>:m.-2<CR>==gi
vnoremap <A-Down> :m'>+1<CR>gv=gv
vnoremap <A-Up> :m'<-2<CR>gv=gv

" }}}

augroup FileTemplates
  au!
  au BufNewFile mrw64*.tex 0r ~/.config/nvim/templates/supotemplate.tex
  au BufNewFile preamble.tex 0r ~/.config/nvim/templates/supopreamble.tex
augroup END

function! SupoWorkTemplate()
  0r ~/.config/nvim/templates/supotemplate.tex
endfunction


" ┌───────────────────────────┐
" │ Inbuilt Terminal Settings │
" └───────────────────────────┘
" {{{
" augroup TerminalConfig
"   au!
"   au TermOpen * setlocal nonumber foldcolumn=0
" augroup END

" " go into normal mode in terminal
" if exists(':tnoremap')
"   tnoremap <Esc><Esc> <c-\><c-n>
" endif

" " open terminal in vertical split
" command Vter vsplit terminal
" " open terminal in horizontal split
" command Ter split terminal
" }}}

" ┌─────────┐
" │ Plugins │
" └─────────┘
runtime! packconfig/*
