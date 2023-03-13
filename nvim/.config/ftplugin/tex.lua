vim.opt.foldmethod = "expr"

vim.opt.wrap = true

vim.opt.titlestring = "‭ﭨ %t%m"

-- Mappings
vim.keymap.set("v", "it", "xi\\textit{}<Esc>P")
vim.keymap.set("v", "em", "xi\\emph{}<Esc>P")
vim.keymap.set("v", "bf", "xi\\textbf{}<Esc>P")
vim.keymap.set("v", "tt", "xi\\texttt{}<Esc>P")
vim.keymap.set("v", "sc", "xi\\textsc{}<Esc>P")
vim.keymap.set("v", "mk", "xi$$<Esc>P")
