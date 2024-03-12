local snippetsDir = vim.fn.stdpath("config") .. "/snippets"

return {
    {
        "L3MON4D3/LuaSnip",
        build = (function()
            -- Build Step is needed for regex support in snippets
            -- This step is not supported in many windows environments
            -- Remove the below condition to re-enable on windows
            if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                return
            end
            return "make install_jsregexp"
        end)(),
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { snippetsDir } })
        end,
    },
    {
        "chrisgrieser/nvim-scissors",
        dependencies = {
            -- optional, for snippet selection
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local scissors = require("scissors")
            ---@diagnostic disable-next-line: missing-fields
            scissors.setup({
                snippetDir = snippetsDir,
                jsonFormatter = "jq",
                editSnippetPopup = {
                    ---@diagnostic disable-next-line: missing-fields
                    keymaps = {
                        deleteSnippet = "<leader>ld", -- LuaSnip Delete
                        cancel = "<Esc>",
                    },
                },
            })

            vim.keymap.set("n", "<leader>le", function()
                scissors.editSnippet()
            end, { desc = "LuaSnip Edit snippet" })

            vim.keymap.set({ "n", "x" }, "<leader>lc", function()
                scissors.addNewSnippet()
            end, { desc = "LuaSnip Create snippet" })
        end,
    },
}
