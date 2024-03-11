local map = vim.keymap.set

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup({
            settings = {
                save_on_toggle = true,
                save_on_ui_close = true,
            },
        })

        map("n", "<leader>ha", function()
            harpoon:list():append()
        end, { desc = "Harpoon Add" })

        map("n", "<leader>hl", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon List" })

        map("n", "<leader>hc", function()
            harpoon:list():clear()
        end, { desc = "Harpoon Clear" })

        for i = 1, 9 do
            map("n", "<leader>h" .. i, function()
                harpoon:list():select(i)
            end, { desc = "Jump to harpoon file [" .. i .. "]" })
        end

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        map("n", "<leader>ht", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Harpoon Telescope" })
    end,
}
