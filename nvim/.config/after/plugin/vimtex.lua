vim.g.tex_flavor = "latex"

vim.g.tex_conceal = "abdg"
vim.opt.conceallevel = 1
-- Disable conceals that are hard to read
vim.g.vimtex_syntax_conceal = {
      accents = 1,
      cites = 1,
      fancy = 1,
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 0,
      math_super_sub = 0,
      math_symbols = 1,
      sections = 0,
      styles = 1,
      ligatures = 1,
}

-- Disable insert mode mappings
vim.g.vimtex_imaps_enabled = false

-- Disable indentation
vim.g.vimtex_indent_enabled = false

-- Enable folding
vim.g.vimtex_fold_enabled = true

