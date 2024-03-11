local typst_icon = {
    icon = "",
    color = "#239dad",
}

return {
    "nvim-tree/nvim-web-devicons",
    opts = {
        override = {
            tex = {
                icon = "",
            },
            typst = typst_icon,
        },
        override_by_extension = {
            typ = typst_icon,
        },
    },
}
