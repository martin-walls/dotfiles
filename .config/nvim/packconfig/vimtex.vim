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
      \ 'accents': 1,
      \ 'cites': 1,
      \ 'fancy': 1,
      \ 'greek': 1,
      \ 'math_bounds': 1,
      \ 'math_delimiters': 1,
      \ 'math_fracs': 0,
      \ 'math_super_sub': 0,
      \ 'math_symbols': 1,
      \ 'sections': 0,
      \ 'styles': 1,
      \ 'ligatures': 1,
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
" never open quickfix window automatically
let g:vimtex_quickfix_mode = 0
