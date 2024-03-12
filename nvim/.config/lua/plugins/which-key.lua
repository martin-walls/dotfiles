return {
    "folke/which-key.nvim",
    event = "VimEnter", -- When to load the plugin
    config = function()
        require("which-key").setup()

        -- Document existing key chains
        require("which-key").register({
            ["<leader>p"] = { name = "Pick", _ = "which_key_ignore" },
            ["<leader>d"] = { name = "Document", _ = "which_key_ignore" },
            ["<leader>w"] = { name = "Workspace", _ = "which_key_ignore" },
            ["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
            ["<leader>r"] = { name = "Rename", _ = "which_key_ignore" },
            ["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
            ["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
            ["<leader>s"] = { name = "Surround", _ = "which_key_ignore" },
            ["<leader>S"] = { name = "Surround on new line", _ = "which_key_ignore" },
        })
    end,
}
