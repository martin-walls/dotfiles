local line_begin_and_in_text = require("mrw.luasnip-utils").latex.line_begin_and_in_text
local get_visual = require("mrw.luasnip-utils").get_visual

return {
    --  ┌───────────────────────────────┐
    --  │ General begin/end environment │
    --  └───────────────────────────────┘
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
        {
            trig = "bfi",
            snippetType = "autosnippet",
            dscr = "Figure environment",
            condition = line_begin_and_in_text,
        },
        fmta(
            [[
                \begin{figure}[ht]
                  \centering
                  \includegraphics[width=0.6\textwidth]{<>}
                  \caption{<>}
                  \label{fig:<>}
                \end{figure}
            ]],
            {
                i(1),
                i(2),
                i(3),
            }
        )
    ),
    s(
        {
            trig = "bmnt",
            dscr = "Minted environment",
            snippetType = "autosnippet",
            condition = line_begin_and_in_text,
        },
        fmta(
            [[
                \begin{minted}{<>}
                <>
                \end{minted}
            ]],
            {
                i(1),
                i(0),
            }
        )
    ),
    -- s(
    --     {
    --         trig = "btbl(%d+)x(%d+)",
    --         dscr = "MxN table",
    --         regTrig = true,
    --     },
    --     [[
    --         TODO
    --     ]]
    -- ),
    --  ┌───────────────────┐
    --  │ Math environments │
    --  └───────────────────┘
    s(
        {
            trig = "nj",
            dscr = "Display math",
            snippetType = "autosnippet",
            condition = line_begin_and_in_text,
        },
        fmta(
            [[
                \begin{align*}
                <>
                \end{align*}
            ]],
            {
                i(0),
            }
        )
    ),
    s(
        {
            trig = "([^%a]?)mk",
            dscr = "Inline math",
            snippetType = "autosnippet",
            regTrig = true,
            wordTrig = false,
        },
        fmta(
            "<>$<>$",
            {
                f(function (_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        )
    ),
}
