local map = vim.keymap.set

-- Highlight all matches on search, but clear the highlight on <Esc>
vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { unique = false })

-- Paste over the top of selection without losing what was copied from the register
map("x", "<leader>p", '"_dP', { desc = "Paste without clearing register" })
-- Copy to black-hole register (_) for operators that are most likely just deleting,
-- not copying
map("n", "x", '"_x')
map("n", "c", '"_c')

-- Return the contents of the lines of the current visual selection.
--
-- Note: this returns the contents of the entire lines, even if the selection is
-- charwise and doesn't include the entirety of the first/last lines.
local function get_visual_selection_lines()
    -- [bufnum, lnum, col, off]
    -- "v" gets the current start of the visual area; the other end is where the
    -- cursor currently is
    local startpos = vim.fn.getpos("v")
    local endpos = vim.fn.getcurpos()

    -- check if startpos is after endpos
    if startpos[2] > endpos[2] or (startpos[2] == endpos[2] and startpos[3] > endpos[3]) then
        startpos, endpos = endpos, startpos
    end

    local lines = vim.api.nvim_buf_get_lines(0, startpos[2] - 1, endpos[2], false)

    local result = table.concat(lines, "\n")

    return result
end

-- Creates a function that checks if the currently selected lines contain
-- only whitespace, and if so prefixes `operator` with `"_` so that it copies to
-- the black hole register (_).
local function copyToBlackHole(operator)
    return function()
        local selected_lines = get_visual_selection_lines()
        -- %s = space character, %c = control character
        if string.match(selected_lines, "[^%s%c]") then
            -- Lines contain at least one non-whitespace char
            return operator
        end
        return '"_' .. operator
    end
end

-- both d and x can be used to delete the visual selection
map("v", "d", copyToBlackHole("d"), { expr = true })
map("v", "x", copyToBlackHole("x"), { expr = true })

map("n", "dd", copyToBlackHole("dd"), { expr = true, desc = "Line" })

-- Move between windows
-- NOTE: these are no longer needed when using vim-tmux-navigator
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")

-- disable arrow keys
map({ "n", "i", "v" }, "<Left>", '<cmd>echo "Arrow keys disabled!"<CR>')
map({ "n", "i", "v" }, "<Right>", '<cmd>echo "Arrow keys disabled!"<CR>')
map({ "n", "i", "v" }, "<Up>", '<cmd>echo "Arrow keys disabled!"<CR>')
map({ "n", "i", "v" }, "<Down>", '<cmd>echo "Arrow keys disabled!"<CR>')
map({ "n", "i", "v" }, "<Home>", '<cmd>echo "Home/End keys disabled!"<CR>')
map({ "n", "i", "v" }, "<End>", '<cmd>echo "Home/End keys disabled!"<CR>')

-- Next and previous search result
-- (center line vertically and open any folds)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Disable J (join lines) in visual mode.
-- Often when trying to execute Vj, the shift key is down slightly too long so
-- VJ gets executed; this mapping prevents this and ensures the intended result.
map("v", "J", "j")

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
map("n", "<C-d>", "8j")
map("n", "<C-u>", "8k")

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
