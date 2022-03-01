" ┌───────┐
" │ LaTeX │
" └───────┘

let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'

" ┌──────────┐
" │ Conceals │
" └──────────┘
let g:tex_conceal='abdg'
set conceallevel=1
" disable unreadable conceals
let g:vimtex_syntax_conceal = {
      \ 'math_fracs': 0,
      \ 'math_super_sub': 0
      \ }
" Use XeLaTeX
let g:vimtex_compiler_latexmk_engines = {
      \ '_': '-xelatex',
      \ 'lualatex': '-lualatex',
      \ 'pdflatex': '-pdf'
      \ }


" ┌─────────┐
" │ Folding │
" └─────────┘
let g:vimtex_fold_types = {
      \ 'envs': {
        \   'blacklist': ['enumerate', 'itemize', 'lstlisting'],
        \   'whitelist': ['examquestion'],
        \ },
        \ }

" ┌────────────────────────┐
" │ Auto Compile and Clean │
" └────────────────────────┘
augroup vimtex_auto_compile_clean
  au!
  au User VimtexEventQuit VimtexClean
  " au User VimtexEventInitPost VimtexCompile
augroup END

" ┌──────────────────┐
" │ Ignored warnings │
" └──────────────────┘
let g:vimtex_quickfix_ignore_filters = [
  \ "\\fancy.*option without twoside",
  \ "Marginpar on page",
  \ ]
