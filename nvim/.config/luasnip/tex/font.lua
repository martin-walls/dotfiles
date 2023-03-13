local get_visual = require("mrw.luasnip-utils").get_visual

return {
    s(
        { trig = ";tt", snippetType = "autosnippet" },
        fmta(
            "\\texttt{<>}",
            { d(1, get_visual) }
        )
    ),
    s(
        { trig = ";it", snippetType = "autosnippet" },
        fmta(
            "\\textit{<>}",
            { d(1, get_visual) }
        )
    ),
    s(
        { trig = ";bf", snippetType = "autosnippet" },
        fmta(
            "\\textbf{<>}",
            { d(1, get_visual) }
        )
    ),
    s(
        { trig = ";sf", snippetType = "autosnippet" },
        fmta(
            "\\textsf{<>}",
            { d(1, get_visual) }
        )
    ),
    s(
        { trig = ";sc", snippetType = "autosnippet" },
        fmta(
            "\\textsc{<>}",
            { d(1, get_visual) }
        )
    ),
    s(
        { trig = ";em", snippetType = "autosnippet" },
        fmta(
            "\\emph{<>}",
            { d(1, get_visual) }
        )
    ),
}
