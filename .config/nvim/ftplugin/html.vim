" ┌───────────────┐
" │ ftplugin/html │
" └───────────────┘
let b:pear_tree_pairs = {
  \ '<*>': {'closer': '</*>', 'not_if': ['br', 'meta']}
  \ }
call extend(b:pear_tree_pairs, g:pear_tree_pairs)
