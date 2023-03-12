local function repeat_enumerate_items(args, parent, _, text)
    local lines = {}
    local count = parent.snippet.captures[1] - 1
    for _ = 1, count do
        table.insert(lines, text)
    end
    return sn(nil, t(lines))
end

return {
    -- General begin/end environment
    s(
        { trig = "bgn", snippetType = "autosnippet", dscr = "Generic environment" },
        fmta(
            [[
                \begin{<>}
                <>
                \end{<>}
            ]],
            {
                i(1),
                i(0),
                rep(1),
            }
        ),
        { condition = line_begin }
    ),
    s(
        { trig = "ben" },
        fmta(
            [[
                \begin{enumerate}
                <>
                \end{enumerate}
            ]],
            {
                i(0),
            },
            { condition = line_begin }
        )
    ),
    -- TODO make this work properly
    s(
        { trig = "([%d]+)ben", regTrig = true, snippetType = "autosnippet" },
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
                d(1, repeat_enumerate_items, {}, { user_args = { "\\item" } })
            },
            { condition = line_begin }
        )
    )
}
