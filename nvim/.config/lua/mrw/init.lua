-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("mrw.packer")
require("mrw.set")
require("mrw.remap")
require("mrw.theme")
