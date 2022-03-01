" ┌─────────────────────┐
" │ ftplugin/javascript │
" └─────────────────────┘
let b:pear_tree_pairs = {
  \ '`': {'closer': '`'}
  \ }
call extend(b:pear_tree_pairs, g:pear_tree_pairs)
