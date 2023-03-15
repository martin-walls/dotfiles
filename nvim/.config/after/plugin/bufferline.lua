local bl = require("bufferline")

bl.setup {
    options = {
        diagnostics = "nvim_lsp",
        hover = {
            enabled = true,
            delay = 50,
            reveal = {"close"}
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                text_align = "center",
                separator = true,
            },
        },
    },
}

-- Next/previous buffer
vim.keymap.set("n", "<leader>bn", function() bl.cycle(1) end)
vim.keymap.set("n", "<leader>bv", function() bl.cycle(-1) end)
-- Pick a buffer to go to
vim.keymap.set("n", "<leader>bg", bl.pick_buffer)
-- Pick a buffer to close
vim.keymap.set("n", "<leader>bc", bl.close_with_pick)

