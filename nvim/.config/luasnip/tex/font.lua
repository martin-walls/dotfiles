local get_visual = require("mrw.luasnip-utils").get_visual

return {
    s(
        { trig = ";tt", snippetType = "autosnippet" },
        fmta(
            [[\texttt{<>}]],
            { d(1, get_visual) }
        )
    ),
}
