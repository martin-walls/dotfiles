" ┌──────────────────────────────┐
" │ Pear Tree (bracket matching) │
" └──────────────────────────────┘

let g:pear_tree_pairs = {
  \ '(': {'closer': ')'},
  \ '[': {'closer': ']'},
  \ '{': {'closer': '}'},
  \ "'": {'closer': "'"},
  \ '"': {'closer': '"'},
  \ '/\*': {'closer': '\*/'},
  \ '<!--': {'closer': '-->'}
  \ }

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_repeatable_expand = 0

" don't map <BS>, <CR>, <Esc>
let g:pear_tree_map_special_keys = 0
