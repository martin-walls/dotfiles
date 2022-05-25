let g:coc_global_extensions = [
  \ 'coc-pyright',
  \ 'coc-clangd',
  \ 'coc-texlab',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-lists',
  \ 'coc-jest',
  \ 'coc-java',
  \ 'coc-rls'
  \ ]
  " \ 'coc-json',
  " \ 'coc-css',
  " \ 'coc-html',
" \ 'coc-git',

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes


" Smart tab completion
" if completion menu open, go down
" if last char is whitespace, insert a tab
" if word is a snippet shortcut, expand the snippet
" otherwise do coc completion
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
      \ coc#refresh()

" also for select mode so snippets work properly
" TODO make this work
" snoremap <silent><expr> <tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#expandableOrJumpable() ?
"       \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
"       \ coc#refresh()
snoremap <silent><expr> <tab> UltiSnips#ExpandSnippetOrJump()


" Smart Enter
" if completion menu open and selected item is a snippet, expand
" it on pressing enter
" otherwise select item from menu,
" or just insert <CR> if menu not open
inoremap <silent><expr> <CR>
      \ pumvisible() ?
      \   (coc#expandableOrJumpable() ?
      \   "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
      \   coc#_select_confirm())
      \ : "\<C-g>u\<CR>"

inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! CocShowDocumentationIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call <SID>show_documentation()
  endif
endfunction

function s:show_hover_documentation()
  if (!exists("g:coc_disable_hover_documentation"))
    call timer_start(500, 'CocShowDocumentationIfNoDiagnostic')
  endif
endfunction

augroup CocCursorHoldActions
  au!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CursorHoldI * :call <SID>show_hover_documentation()
  autocmd CursorHold * :call <SID>show_hover_documentation()
augroup END

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Code actions
nnoremap <leader>do <Plug>(coc-codeaction)

" Diagnostics
nnoremap <silent> <leader>dg :CocList diagnostics<CR>

let g:coc_filetype_map = {'tex': 'latex'}
