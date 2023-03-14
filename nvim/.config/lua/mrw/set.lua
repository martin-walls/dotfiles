-- Set <space> as the leader key
vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.smartindent = true

-- Don't wrap lines by default
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- Be able to undo things from before this current session
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Don't highlight all search results
vim.opt.hlsearch = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.sidescrolloff=8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.mousemoveevent = true

-- Autosave on close
vim.opt.autowrite = true
vim.opt.autowriteall = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.title = true

vim.opt.linebreak = true
vim.opt.spelllang = "en"

vim.opt.fillchars = { fold = " ", foldopen = "┍", foldsep = "│" }
vim.opt.foldcolumn = "2"

