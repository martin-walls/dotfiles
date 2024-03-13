local utils = require("mrw.utils")

vim.opt_local.spell = true

utils.indent_width(2)

-- treat "-" as part of word characters
vim.opt_local.iskeyword:append("-")
