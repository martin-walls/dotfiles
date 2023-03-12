local M = {}

-- explicitly define LuaSnip node abbreviations
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

-- Summary: When `SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `SELECT_RAW` is empty, the function simply returns an empty insert node.
function M.get_visual(args, parent)
    if (#parent.snippet.env.SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
    else
        return sn(nil, i(1, ""))
    end
end

local latex = {}

function latex.in_math()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

function latex.in_text()
    return not latex.in_math()
end

function latex.in_comment()
    return vim.fn["vimtex#syntax#in_comment"]() == 1
end

-- Detect generic environment
function latex.in_env(name)
    local is_inside = vim.fn["vimtex#env#is_inside"](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

M.latex = latex;

return M
