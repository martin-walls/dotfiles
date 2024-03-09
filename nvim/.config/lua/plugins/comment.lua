return {
    {"numToStr/Comment.nvim", opts = {
        mappings = {
            -- Includes
            --   `gcc`               -> line-comment the current line
            --   `gbc`               -> block-comment the current line
            --   `gc[count]{motion}` -> line-comment the region contained in {motion}
            --   `gb[count]{motion}` -> block-comment the region contained in {motion}
            basic = true,
            -- Includes `gco`, `gcO`, `gcA`
            extra = true,
        },
        opleader = {
            line = "gc",
            block = "gb",
        },
    }}
}
