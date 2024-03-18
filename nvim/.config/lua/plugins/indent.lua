return {
    { -- Automatically detect the indentation style used in a buffer
        "NMAC427/guess-indent.nvim",
        opts = {
            filetype_exclude = {
                "typst",
            },
        },
    },
}
