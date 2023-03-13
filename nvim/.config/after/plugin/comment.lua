require("Comment").setup({
    mappings = {
        extra = false,
    },
    toggler = {
        line = "<leader>c",
        block = "<leader>bc",
    },
})

vim.keymap.set("n", "<C-/>", "<leader>c", {remap = true})

