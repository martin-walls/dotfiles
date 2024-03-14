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
                    RainbowDelimiter1 = {
                        fg = "$yellow",
                    },
                    RainbowDelimiter2 = {
                        fg = "$blue",
                    },
                    RainbowDelimiter3 = {
                        fg = "$orange",
                    },
                    RainbowDelimiter4 = {
                        fg = "$purple",
                    },
                    RainbowDelimiter5 = {
                        fg = "$cyan",
                    },
                    RainbowDelimiter6 = {
                        fg = "$red",
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
                    "RainbowDelimiter1",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiter2",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiter3",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiter4",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiter5",
                    "RainbowDelimiterCyan",
                    "RainbowDelimiter6",
                    "RainbowDelimiterRed",
                },
            }
        end,
    },
}
