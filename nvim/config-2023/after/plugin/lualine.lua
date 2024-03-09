-- show <currentline>/<linecount>
local function location()
    local currentLine = vim.api.nvim_win_get_cursor(0)[1]
    local totalLineCount = vim.api.nvim_buf_line_count(0)
    return currentLine .. "/" .. totalLineCount
end

require("lualine").setup {
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "%{ObsessionStatus('', '')}" },
        lualine_x = { "filetype", "diagnostics" },
        lualine_y = { location },
        lualine_z = { "branch" },
    },
    options = {
        -- Separator between sections
        section_separators = { left = "▌", right = "▐" },
        -- Separator within a section
        component_separators = { left = "│", right = "│" },
    },
}
