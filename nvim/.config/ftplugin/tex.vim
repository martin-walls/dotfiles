" ┌──────────────┐
" │ ftplugin/tex │
" └──────────────┘

" enable spellcheck
setlocal spell

" autosave on write
"   Put it in a function so it can be called again if needed.
"   For some reason switching away from a Tex buffer and back again
"   disables the autosave, so it's useful to have the option to
"   enable it again.
function! TexEnableAutoSaveOnWrite()
  augroup autosave_on_write
    au!
    au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif
  augroup END
endfunction

call TexEnableAutoSaveOnWrite()

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
