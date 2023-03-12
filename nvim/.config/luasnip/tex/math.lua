local in_math = require("mrw.luasnip-utils").latex.in_math

return {
    s(
        { trig = ";;a", snippetType = "autosnippet" },
        {
            t("\\alpha"),
        },
        { condition = in_math }
    )
}
