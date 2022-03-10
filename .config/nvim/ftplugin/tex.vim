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

let g:coc_disable_hover_documentation = 1

" MAPPINGS
vnoremap <leader>it xi\textit{}<Esc>P
vnoremap <leader>bf xi\textbf{}<Esc>P
vnoremap <leader>tt xi\texttt{}<Esc>P
vnoremap <leader>sc xi\textsc{}<Esc>P
