---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup({
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@comment.outer",
                ["ic"] = "@comment.inner",
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@function.outer'] = 'V', -- linewise
                ['@comment.outer'] = 'V',
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = false,
        },
        lsp_interop = {
            enable = true,
            border = 'single',
            floating_preview_opts = {},
            peek_definition_code = {
                -- Show definition of surrounding textobject
                ["<leader>kf"] = "@function.outer",
                ["<leader>kc"] = "@class.outer",
            },
        },
    },
})
