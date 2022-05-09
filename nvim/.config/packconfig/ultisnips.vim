" ┌───────────┐
" │ UltiSnips │
" └───────────┘

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']

function GetLineCommentMarker()
  if len(split(&l:commentstring, '%s')) == 1
    " if 'commentstring' xx%sxx contains no end part
    return split(&l:commentstring, '%s')[0]
  elseif match(&l:comments, '\v(,|^):[^,:]*(,|$)')
    " if 'comments' contains ',:xx,'
    return matchstr(&l:comments, '\v(,|^):\zs[^,:]*\ze(,|$)')
  else
    echoerr "Unable to find line comment marker."
  endif
endfunction

" ┌──────────┐
" │ Mappings │
" └──────────┘
let g:UltiSnipsExpandTrigger = '<f2>'
let g:UltiSnipsJumpForwardTrigger = '<f2>'
let g:UltiSnipsJumpBackwardTrigger = '<s-f2>'
let g:UltiSnipsEditSplit = 'context'
