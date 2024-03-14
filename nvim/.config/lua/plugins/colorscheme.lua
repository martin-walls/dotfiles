return {
    {
        "navarasu/onedark.nvim",
        -- Make sure to load colorscheme during startup
        lazy = false,
        -- Load this before other plugins
        priority = 1000,
        config = function()
            require("onedark").setup({
                -- Don't need to change this for light/dark theme, it happens automatically
                -- when vim.o.background is changed
                style = "dark",
                -- This line is technically unnecessary when overriding the EndOfBuffer
                -- highlight group directly
                ending_tildes = true,
                highlights = {
                    EndOfBuffer = {
                        fg = "$grey",
                    },
                    ["@comment"] = {
                        -- make comments stand out slightly more
                        bg = "$bg_d",
                    },
                },
            })
            require("onedark").load()
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            vim.g.rainbow_delimiters = {
                highlight = {
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                    "RainbowDelimiterRed",
                },
            }
        end,
    },
}
