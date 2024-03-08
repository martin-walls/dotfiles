local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            filters = {
                -- show .gitignored files
                git_ignored = false,
            },
            -- reload the file tree every time we enter its buffer
            reload_on_bufenter = true,
            view = {
                signcolumn = "auto",
                float = {
                    enable = true,
                    -- this prevents errors when nvim-tree opens in a full buffer, notably
                    -- when we start nvim in a directory so it opens to the tree.
                    quit_on_focus_loss = false,
                    open_win_config = function()
                        -- dimens of the entire editor window
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        -- dimens of the file tree floating window
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        -- offset of the floating window, such that it is centered on the screen
                        local offset_x = (screen_w - window_w) / 2
                        local offset_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

                        return {
                            border = "none",
                            relative = "editor",
                            row = offset_y,
                            col = offset_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },
            },
        })

        vim.keymap.set("n", "<leader>-", vim.cmd.NvimTreeToggle, { desc = "Toggle file tree" })
    end,
}
