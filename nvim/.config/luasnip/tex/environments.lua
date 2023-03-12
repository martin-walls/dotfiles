
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
    )
}
