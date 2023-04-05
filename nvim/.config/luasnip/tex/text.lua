local in_text = require("mrw.luasnip-utils").latex.in_text

return {
    s(
        {
            trig = "eg.",
            condition = in_text,
        },
        t("e.g.\\")
    ),
    s(
        {
            trig = "ie.",
            condition = in_text,
        },
        t("i.e.\\")
    ),
}
