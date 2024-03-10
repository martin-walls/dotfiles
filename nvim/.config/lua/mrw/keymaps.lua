local map = require("mrw.utils").mapUnique

-- Highlight all matches on search, but clear the highlight on <Esc>
vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>", {unique = false})

-- Paste over the top of selection without losing what was copied from the register
map("x", "<leader>p", '"_dP', { desc = "Paste without clearing register" })

-- Move between windows
-- NOTE: these are no longer needed when using vim-tmux-navigator
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")

-- disable arrow keys
map("", "<Left>", '<cmd>echo "Arrow keys disabled!"<CR>')
map("", "<Right>", '<cmd>echo "Arrow keys disabled!"<CR>')
map("", "<Up>", '<cmd>echo "Arrow keys disabled!"<CR>')
map("", "<Down>", '<cmd>echo "Arrow keys disabled!"<CR>')
map("", "<Home>", '<cmd>echo "Home/End keys disabled!"<CR>')
map("", "<End>", '<cmd>echo "Home/End keys disabled!"<CR>')

-- Next and previous search result
-- (center line vertically and open any folds)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Add brackets/quotes around visual selection
map("v", "{", "xi{}<Esc>P")
map("v", "(", "xi()<Esc>P")
map("v", "[", "xi[]<Esc>P")
map("v", '"', 'xi""<Esc>P')
map("v", "'", "xi''<Esc>P")

-- Move up/down line as it appears on screen (i.e. handle wrapping)
map("n", "j", "gj")
map("n", "k", "gk")

-- Start/end of line
map("n", "H", "g^")
map("n", "L", "g_")

-- Larger vertical jumps
map("n", "<C-d>", "8<C-d>")
map("n", "<C-u>", "8<C-u>")

-- Move lines up/down, and reindent to match new position
map("n", "<A-j>", ":m.+1<CR>==")
map("n", "<A-k>", ":m.-2<CR>==")
map("i", "<A-j>", "<Esc>:m.+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m.-2<CR>==gi")
map("v", "<A-j>", ":m'>+1<CR>gv=gv")
map("v", "<A-k>", ":m'<-2<CR>gv=gv")

-- Move between diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next [D]iagnostic message" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
