local in_text = require("mrw.luasnip-utils").latex.in_text
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local function line_begin_and_in_text(line_to_cursor, matched_trigger, captures)
    return line_begin(line_to_cursor, matched_trigger, captures)
        and in_text()
end

-- will never realistically need this many items in an enumerate
local roman_numerals = {
    "i",
    "ii",
    "iii",
    "iv",
    "v",
    "vi",
    "vii",
    "viii",
    "ix",
    "x",
    "xi",
    "xii",
    "xiii",
    "xiv",
    "xv",
    "xvi",
    "xvii",
    "xviii",
    "xix",
    "xx"
}

return {
    -- Enumerate snippets
    s(
        { trig = "ben", condition = line_begin_and_in_text, priority = 100 },
        fmta(
            [[
                \begin{enumerate}
                <>
                \end{enumerate}
            ]],
            {
                i(0),
            }
        )
    ),
    s(
        { trig = "([%d]+)ben", regTrig = true, snippetType = "autosnippet", condition = line_begin_and_in_text },
        fmta(
            [[
                \begin{enumerate}
                <><>
                <>
                \end{enumerate}
            ]],
            {
                t("\\item % (1)"),
                i(0),
                d(1, function (_, parent)
                    local lines = {}
                    for i = 2, parent.snippet.captures[1] do
                        table.insert(lines, "\\item % ("..i..")")
                    end
                    return sn(nil, t(lines))
                end, {})
            }
        )
    ),
    s(
        { trig = "([%a])ben", regTrig = true, snippetType = "autosnippet", condition = line_begin_and_in_text },
        fmta(
            [[
                \begin{enumerate}
                <><>
                <>
                \end{enumerate}
            ]],
            {
                t("\\item % (a)"),
                i(0),
                d(1, function (_, parent)
                    local lines = {}
                    local count = string.byte(parent.snippet.captures[1]) - string.byte("a") + 1
                    for i = 2, count do
                        local label = string.char(string.byte("a") + i - 1)
                        table.insert(lines, "\\item % ("..label..")")
                    end
                    return sn(nil, t(lines))
                end, {})
            }
        )
    ),
    s(
        { trig = "([%d]+)iben", regTrig = true, snippetType = "autosnippet", condition = line_begin_and_in_text, priority = 2000 },
        fmta(
            [[
                \begin{enumerate}
                <><>
                <>
                \end{enumerate}
            ]],
            {
                t("\\item % (i)"),
                i(0),
                d(1, function (_, parent)
                    local lines = {}
                    local count = parent.snippet.captures[1]
                    for i = 2, count do
                        local label = roman_numerals[i]
                        table.insert(lines, "\\item % ("..label..")")
                    end
                    return sn(nil, t(lines))
                end, {})
            }
        )
    ),

    -- Itemize snippets
    s(
        { trig = "bit", condition = line_begin_and_in_text, priority = 100 },
        fmta(
            [[
                \begin{itemize}
                <>
                \end{itemize}
            ]],
            {
                i(0),
            }
        )
    ),
    s(
        { trig = "([%d]+)bit", regTrig = true, snippetType = "autosnippet", condition = line_begin_and_in_text },
        fmta(
            [[
                \begin{enumerate}
                <><>
                <>
                \end{enumerate}
            ]],
            {
                t("\\item"),
                i(0),
                d(1, function (_, parent)
                    local lines = {}
                    for _ = 2, parent.snippet.captures[1] do
                        table.insert(lines, "\\item")
                    end
                    return sn(nil, t(lines))
                end, {})
            }
        )
    ),
}
