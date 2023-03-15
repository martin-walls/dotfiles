local builtin = require('telescope.builtin')
-- Search all files in project
vim.keymap.set('n', '<leader>pf', builtin.find_files)
-- Search all files in the git repo
vim.keymap.set('n', '<C-p>', builtin.git_files)
-- Grep for a search string across project
vim.keymap.set("n", "<leader>ps", builtin.live_grep)
-- Currently open buffers
vim.keymap.set("n", "<leader>b", builtin.buffers)

--  ┌─────┐
--  │ LSP │
--  └─────┘
-- All diagnostics
vim.keymap.set("n", "<leader>pd", builtin.diagnostics)
-- Current file diagnostics
vim.keymap.set("n", "<leader>fd", function()
    builtin.diagnostics({ bufnr = 0 })
end)
-- References of symbol under cursor
vim.keymap.set("n", "gr", builtin.lsp_references)
-- Implementation(s) for symbol under cursor
vim.keymap.set("n", "gi", builtin.lsp_implementations)
-- Definition(s) of symbol under cursor
vim.keymap.set("n", "gd", builtin.lsp_definitions)
-- Definition(s) of type of symbol under cursor
vim.keymap.set("n", "go", builtin.lsp_type_definitions)


require("telescope").setup({
    defaults = {
        layout_strategy = "vertical",
    },
})