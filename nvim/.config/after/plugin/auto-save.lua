require("auto-save").setup({
    events = { "InsertLeave", "TextChanged", "BufLeave" },
    timeout = 10,
})
