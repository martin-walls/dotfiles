" ┌───────────┐
" │ Lightline │
" └───────────┘

" make lightline show
set laststatus=2
" disable default -- INSERT -- etc
set noshowmode

" to show bufferlist
set showtabline=2

let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'gitbranch' ], [ 'lineinfo' ], [ 'filetype' ] ]
  \ },
  \ 'inactive': {
  \   'left': [[ 'filename', 'modified' ]]
  \ },
  \ 'tabline': {
  \   'left': [[ 'buffers' ]],
  \   'right': [[ ]]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineGitBranch',
  \   'lineinfo': 'LightlineLineInfo',
  \   'percent': 'LightlinePercent',
  \   'filetype': 'LightlineFiletype',
  \   'mode': 'LightlineMode'
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ },
  \ 'component_raw': {
  \   'buffers': 1
  \ },
  \ }
" \ 'separator': {
" \   'left': '',
" \   'right': ''
" \ }

function! LightlineLineInfo() abort
  if winwidth(0) < 75
    return ''
  endif

  let l:current_line = printf('%-3s', line('.'))
  let l:max_line = printf('%-3s', line('$'))
  let l:lineinfo = l:current_line . '/' . l:max_line
  return l:lineinfo
endfunction

function! LightlinePercent() abort
  if winwidth(0) < 55
    return ''
  endif

  let l:percent = line('.') * 100 / line('$') . '%'
  return printf('%-4s', l:percent)
endfunction

function! LightlineFiletype() abort
  if winwidth(0) < 40
    return ''
  elseif winwidth(0) < 55
    return WebDevIconsGetFileTypeSymbol()
  endif

  return &filetype . ' ' . WebDevIconsGetFileTypeSymbol()
endfunction

function! LightlineMode() abort
  let ftmap = {
        \ 'netrw': 'EXPLORER'
        \ }
  return get(ftmap, &filetype, lightline#mode())
endfunction

function LightlineGitBranch() abort
  if winwidth(0) < 75
    return ''
  endif

  return " " . gitbranch#name()
endfunction
