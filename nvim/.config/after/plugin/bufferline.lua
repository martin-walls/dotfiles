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
        numbers = function (opts)
            return opts.raise(opts.id)
        end
    },
}

-- Next/previous buffer
vim.keymap.set("n", "bn", function() bl.cycle(1) end)
vim.keymap.set("n", "bv", function() bl.cycle(-1) end)
-- Pick a buffer to go to
vim.keymap.set("n", "bg", bl.pick_buffer)
-- Pick a buffer to close
vim.keymap.set("n", "bc", bl.close_with_pick)

