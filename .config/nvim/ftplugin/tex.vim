" ┌──────────────┐
" │ ftplugin/tex │
" └──────────────┘
" custom bracket closers
let b:pear_tree_pairs = {
  \ '$': {'closer': '$'},
  \ '`': {'closer': "'"}
  \ }
call extend(b:pear_tree_pairs, g:pear_tree_pairs)

" enable spellcheck
setlocal spell

" autosave on write
augroup autosave_on_write
  au!
  au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif
augroup END

" vimtex folding
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
set foldcolumn=4

" file templates
au BufNewFile mrw64*.tex 0r ~/.config/nvim/templates/supotemplate.tex
au BufNewFile preamble.tex 0r ~/.config/nvim/templates/supopreamble.tex
