local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local nvim_tree = require("nvim-tree.api")

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function(data)
        -- Only show startup view if we opened a directory, not a file directly
        local is_dir = vim.fn.isdirectory(data.file) == 1
        if not is_dir then
            return
        end
        -- Check if harpoon has marks,
        -- else show file browser
        local mark_count = harpoon_mark.get_length()
        if mark_count > 0 then
            harpoon_ui.toggle_quick_menu()
        else
            -- cd to the dir, in case nvim was opened with path to other dir
            vim.cmd.cd(data.file)
            nvim_tree.tree.open()
        end
    end
})
