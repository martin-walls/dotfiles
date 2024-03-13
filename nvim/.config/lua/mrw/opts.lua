local utils = require("mrw.utils")
local opt = vim.opt

-- opt.number = true
-- opt.relativenumber = true

-- Don't show the mode in the command line, because we have it in the statusline anyway
opt.showmode = false

-- Use the system clipboard
opt.clipboard = "unnamedplus"

opt.wrap = true
-- If lines are wrapped, use the same indent width as the start of the line.
-- (This will preserve horizontal blocks of text.)
opt.breakindent = true
-- Break at sensible characters
opt.linebreak = true
-- string to show at the start of wrapped lines
opt.showbreak = "↪ "

-- slightly transparent completion popup menu on the command line
opt.pumblend = 15

-- Save undo history
opt.undofile = true

-- Case-insensitive searching
-- (unless \C or capital in search)
opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"

-- Decrease update time
-- updatetime is used for the CursorHold event
opt.updatetime = 250
-- timeoutlen is the length of time (ms) to wait for keymap sequences to complete
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

-- How to display whitespace
opt.list = true
opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}
opt.fillchars = {
    eob = "~",
}

-- cursorline, but only in the active buffer
opt.cursorline = true
local set_cursorline_group = vim.api.nvim_create_augroup("SetCursorLine", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = set_cursorline_group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
        end,
    })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- Line length marker
opt.colorcolumn = "80"

opt.scrolloff = 12
opt.sidescrolloff = 8

utils.indent_width(4, { global = true })
opt.expandtab = true

-- Autosave on close
opt.autowrite = true
opt.autowriteall = true

opt.title = true

opt.spelllang = "en_gb"
