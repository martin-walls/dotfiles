return {
    "folke/which-key.nvim",
    event = "VimEnter", -- When to load the plugin
    config = function ()
        require("which-key").setup()

        -- Document existing key chains
        require('which-key').register({
            ["<leader>p"] = { name = "[P]ick", _ = "which_key_ignore" },
            ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
            -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
            -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        })
    end
}
