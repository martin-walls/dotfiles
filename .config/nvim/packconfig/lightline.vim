" ┌───────────┐
" │ Lightline │
" └───────────┘

" make lightline show
set laststatus=2
" disable default -- INSERT -- etc
set noshowmode

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'gitbranch' ], [ 'percent', 'lineinfo' ], [ 'filetype' ] ]
  \ },
  \ 'inactive': {
  \   'left': [[ 'filename', 'modified' ]]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineGitBranch',
  \   'lineinfo': 'LightlineLineInfo',
  \   'percent': 'LightlinePercent',
  \   'filetype': 'LightlineFiletype',
  \   'mode': 'LightlineMode'
  \ },
  \ }

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
  if winwidth(0) < 55
    return ''
  endif

  return &filetype
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
