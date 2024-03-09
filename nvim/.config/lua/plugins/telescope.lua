local map = require("mrw.utils").mapUnique

return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { -- If encountering errors, see telescope-fzf-native README for install instructions
            "nvim-telescope/telescope-fzf-native.nvim",

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            build = "make",

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        -- To open a window showing keymaps for the current telescope picker:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?

        -- See `:help telescope` and `:help telescope.setup()`
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        -- Enable telescope extensions, if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        map("n", "<C-p>", builtin.find_files, { desc = "[P]ick [F]iles" })
        map("n", "<leader>pg", builtin.live_grep, { desc = "[P]ick by [G]rep" })
        map("n", "<leader>ph", builtin.help_tags, { desc = "[P]ick [H]elp" })
        map("n", "<leader>pk", builtin.keymaps, { desc = "[P]ick [K]eymaps" })
        -- choose a telescope picker to open, from the list of all available pickers
        map("n", "<leader>ps", builtin.builtin, { desc = "[P]ick [S]elect Telescope" })
        -- re-open the previous telescope picker
        map("n", "<leader>pr", builtin.resume, { desc = "[P]ick [R]esume" })
        map("n", "<leader>p.", builtin.oldfiles, { desc = '[P]ick Recent Files ("." for repeat)' })

        -- LSP
        map("n", "<leader>pd", builtin.diagnostics, { desc = "[P]ick [D]iagnostics" })

        -- Slightly advanced example of overriding default behavior and theme
        map("n", "<leader>/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                previewer = false,
            }))
        end, { desc = "Fuzzily search in current buffer" })
    end,
}
