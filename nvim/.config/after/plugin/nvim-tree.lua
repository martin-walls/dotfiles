--local M = {}
--local api = require("nvim-tree.api")
--
--function M.on_attach(bufnr)
--    -- Set key mappings
--    vim.keymap.set("n", "<leader>pv", "")
--end

require("nvim-tree").setup {
    git = {
        -- show files that are gitignored
        ignore = false,
    },
}

vim.keymap.set("n", "<leader>-", vim.cmd.NvimTreeToggle)
