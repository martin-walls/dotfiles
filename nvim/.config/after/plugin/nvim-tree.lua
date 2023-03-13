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
    reload_on_bufenter = true,
}

vim.keymap.set("n", "<leader>-", vim.cmd.NvimTreeToggle)

-- Open nvim-tree if we open nvim to a folder
vim.api.nvim_create_autocmd({ "VimEnter" },
    {
        callback = function (data)
            -- buffer is a directory
            local is_directory = vim.fn.isdirectory(data.file) == 1

            if not is_directory then
                return
            end

            -- change to the directory
            vim.cmd.cd(data.file)

            -- open the tree
            require("nvim-tree.api").tree.open()
        end
    }
)
