-- Use <Space> as the leader key
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode in the command line, because we have it in the statusline anyway
vim.opt.showmode = false

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- If lines are wrapped, use the same indent width as the start of the line.
-- (This will preserve horizontal blocks of text.)
vim.opt.breakindent = true
-- Break at sensible characters
vim.opt.linebreak = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching
-- (unless \C or capital in search)
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

-- Decrease update time
-- updatetime is used for the CursorHold event
vim.opt.updatetime = 250
-- timeoutlen is the length of time (ms) to wait for keymap sequences to complete
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- How to display whitespace
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}

-- Preview substitutions live in a temporary window
vim.opt.inccommand = "split"

vim.opt.cursorline = true
-- Line length marker
vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Autosave on close
vim.opt.autowrite = true
vim.opt.autowriteall = true

vim.opt.title = true
