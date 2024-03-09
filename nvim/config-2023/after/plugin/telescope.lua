local builtin = require('telescope.builtin')
-- Search all files in project
vim.keymap.set('n', '<leader>pv', builtin.find_files)
-- Search all files in the git repo
vim.keymap.set('n', '<C-p>', builtin.git_files)
-- Grep for a search string across project
vim.keymap.set("n", "<leader>pg", builtin.live_grep)
-- Currently open buffers
vim.keymap.set("n", "<leader>pb", builtin.buffers)

--  ┌─────┐
--  │ LSP │
--  └─────┘
-- All diagnostics
vim.keymap.set("n", "<leader>pd", builtin.diagnostics)
-- Current file diagnostics
vim.keymap.set("n", "<leader>pf", function()
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
-- Symbols in the current buffer
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols)
-- Symbols across whole project
vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols)


-- Resume last picker
vim.keymap.set("n", "<leader>pr", builtin.resume)


require("telescope").setup({
    defaults = {
        layout_strategy = "vertical",
    },
    pickers = {
        find_files = {
            -- Don't ignore any files, even gitignored files
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
        },
    },
})
