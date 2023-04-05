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
-- Add quotes around visual selection
vim.keymap.set("v", '"', 'xi""<Esc>P')

-- Move up/down one line as it appears on screen (i.e. handle wrapping)
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<Down>", "gj")
vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("i", "<Down>", "<C-o>gj")
vim.keymap.set("i", "<Up>", "<C-o>gk")

-- Home/End for line as it appears on screen
vim.keymap.set("n", "<Home>", "g^")
vim.keymap.set("n", "<End>", "g$")
vim.keymap.set("i", "<Home>", "<C-o>g^")
vim.keymap.set("i", "<End>", "<C-o>g$")

-- Move lines up/down, and reindent to match new position
vim.keymap.set("n", "<A-j>", ":m.+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m.-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m.+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m.-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m'>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m'<-2<CR>gv=gv")

-- Horizontal scrolling
vim.keymap.set("n", "H", "zh")
vim.keymap.set("n", "L", "zl")
