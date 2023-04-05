local get_visual = require("mrw.luasnip-utils").get_visual
local in_text = require("mrw.luasnip-utils").latex.in_text
local in_math = require("mrw.luasnip-utils").latex.in_math

return {
    --  ┌───────────┐
    --  │ Monospace │
    --  └───────────┘
    s(
        { trig = ";tt", snippetType = "autosnippet", condition = in_text },
        fmta(
            "\\texttt{<>}",
            { d(1, get_visual) }
        )
    ),
    --  ┌────────┐
    --  │ Italic │
    --  └────────┘
    s(
        { trig = ";it", snippetType = "autosnippet", condition = in_text },
        fmta(
            "\\textit{<>}",
            { d(1, get_visual) }
        )
    ),
    s(
        { trig = ";it", snippetType = "autosnippet", condition = in_math },
        fmta(
            "\\mathit{<>}",
            { d(1, get_visual) }
        )
    ),
    --  ┌──────┐
    --  │ Bold │
    --  └──────┘
    s(
        { trig = ";bf", snippetType = "autosnippet", condition = in_text },
        fmta(
            "\\textbf{<>}",
            { d(1, get_visual) }
        )
    ),
    s(
        { trig = ";bf", snippetType = "autosnippet", condition = in_math },
        fmta(
            "\\mathbf{<>}",
            { d(1, get_visual) }
        )
    ),
    --  ┌────────────┐
    --  │ Sans-serif │
    --  └────────────┘
    s(
        { trig = ";sf", snippetType = "autosnippet", condition = in_text },
        fmta(
            "\\textsf{<>}",
            { d(1, get_visual) }
        )
    ),
    --  ┌────────────┐
    --  │ Small caps │
    --  └────────────┘
    s(
        { trig = ";sc", snippetType = "autosnippet", condition = in_text },
        fmta(
            "\\textsc{<>}",
            { d(1, get_visual) }
        )
    ),
    --  ┌──────────┐
    --  │ Emphasis │
    --  └──────────┘
    s(
        { trig = ";em", snippetType = "autosnippet", condition = in_text },
        fmta(
            "\\emph{<>}",
            { d(1, get_visual) }
        )
    ),
}
