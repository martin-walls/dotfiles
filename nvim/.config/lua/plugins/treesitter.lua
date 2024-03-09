return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            -- Configure Treesitter. See `:help nvim-treesitter`

            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "html",
                    "lua",
                    "markdown",
                    "vim",
                    "vimdoc",
                    "javascript",
                    "typescript",
                    "svelte",
                    "rust",
                    "java",
                },
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })

            -- There are additional nvim-treesitter modules that you can use to interact
            -- with nvim-treesitter. You should go explore a few and see what interests you:
            --
            --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
            --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
            --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = { query = "@function.outer", desc = "[A]round [F]unction" },
                            ["if"] = { query = "@function.inner", desc = "[I]nside [F]unction" },
                            ["ac"] = { query = "@comment.outer", desc = "[A]round [C]omment" },
                            ["ic"] = { query = "@comment.inner", desc = "[I]nside [C]omment" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ["@function.outer"] = "V", -- linewise
                            ["@comment.outer"] = "V",
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
                        border = "single",
                        floating_preview_opts = {},
                        peek_definition_code = {
                            -- Show definition of surrounding textobject
                            ["<leader>kf"] = "@function.outer",
                            ["<leader>kc"] = "@class.outer",
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/playground",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            max_lines = 4,
        },
    },
}
