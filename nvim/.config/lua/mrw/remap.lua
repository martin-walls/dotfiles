vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Paste over the top of selection without losing what was copied from the register
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
