local utils = require("mrw.utils")

vim.opt_local.spell = true

utils.indent_width(2)

-- treat "-" as part of word characters
vim.opt_local.iskeyword:append("-")

-- TODO: map <CR> to function that detects if the current line is a list item;
-- if so, create a new list item on the next line, with the same level of indentation
