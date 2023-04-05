require("nvim-tree").setup {
    git = {
        -- show files that are gitignored
        ignore = false,
    },
    reload_on_bufenter = true,
}

vim.keymap.set("n", "<leader>-", vim.cmd.NvimTreeToggle)

