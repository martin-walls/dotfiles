require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        hover = {
            enabled = true,
            delay = 50,
            reveal = {"close"}
        },
    },
}

