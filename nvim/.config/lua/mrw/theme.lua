require("onedark").setup({
    -- Don't need to change this for light/dark theme, it happens automatically
    -- when vim.o.background is changed
    style = "dark",
})
require("onedark").load()

-- local function get_system_theme()
--     local theme_file = io.open(os.getenv("HOME") .. "/.dotfiles/theme/CURRENT_THEME", "r")
--     if (theme_file == nil) then
--         return "dark"
--     end
--     return theme_file:read("*l")
-- end
--
-- local system_theme = get_system_theme()
-- if system_theme == "light" then
--     vim.o.background = "light"
-- else
--     vim.o.background = "dark"
-- end
