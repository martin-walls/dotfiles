--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Paste over the top of selection without losing what was copied from the register
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Next buffer
vim.keymap.set("n", "<A-n>", vim.cmd.bnext)
-- Previous buffer
vim.keymap.set("n", "<A-b>", vim.cmd.bprevious)

-- Half-page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Next and previous search result
-- (center line vertically and open any folds)
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Add brackets around visual selection
vim.keymap.set("v", "{", "xi{}<Esc>P")
vim.keymap.set("v", "(", "xi()<Esc>P")
vim.keymap.set("v", "[", "xi[]<Esc>P")
