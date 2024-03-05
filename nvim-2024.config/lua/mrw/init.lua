-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use <Space> as the leader key
vim.g.mapleader = " "

require("mrw.lazy")
require("mrw.opts")
require("mrw.keymaps")
require("mrw.filetypes")
