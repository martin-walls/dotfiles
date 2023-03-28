local in_math = require("mrw.luasnip-utils").latex.in_math
local in_env = require("mrw.luasnip-utils").latex.in_env
local get_visual = require("mrw.luasnip-utils").get_visual

local function in_align_env()
    return in_env("align") or in_env("align*")
end

return {
    s(
        {
            trig = "//",
            dscr = "Fraction",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("\\frac{<>}{<>}", { d(1, get_visual), i(2) })
    ),
    s(
        {
            trig = "sr",
            snippetType = "autosnippet",
            condition = in_math,
            wordTrig = false,
        },
        t("^2")
    ),
    s(
        {
            trig = "cb",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("^3")
    ),
    s(
        {
            trig = "xx",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("\\times")
    ),
    s(
        {
            trig = "**",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("\\cdot")
    ),
    s(
        {
            trig = "ceil",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("\\left\\lceil <> \\right\\rceil", { i(1) })
    ),
    s(
        {
            trig = "floor",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("\\left\\lfloor <> \\right\\rfloor", { i(1) })
    ),
    --  ┌────────────────────┐
    --  │ Equality operators │
    --  └────────────────────┘
    s(
        {
            trig = "==",
            snippetType = "autosnippet",
            condition = in_align_env,
        },
        t("&=")
    ),
    s(
        {
            trig = "!=",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("\\neq")
    ),
    s(
        {
            trig = ">=",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("\\geqslant")
    ),
    s(
        {
            trig = "<=",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("\\leqslant")
    ),
    --  ┌────────┐
    --  │ Arrows │
    --  └────────┘
    s(
        {
            trig = "->",
            snippetType = "autosnippet",
            condition = in_math,
            priority = 100,
        },
        t("\\rightarrow")
    ),
    s(
        {
            trig = "-->",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("\\longrightarrow")
    ),
    s(
        {
            trig = "=>",
            snippetType = "autosnippet",
            condition = in_math,
            priority = 100,
        },
        t("\\Rightarrow")
    ),
    s(
        {
            trig = "==>",
            snippetType = "autosnippet",
            condition = in_math,
        },
        t("\\Longrightarrow")
    ),
    s(
        {
            trig = "<-",
            snippetType = "autosnippet",
            condition = in_math,
            priority = 100,
        },
        t("\\leftarrow")
    ),
    --  ┌───────────────────────────┐
    --  │ Superscript and Subscript │
    --  └───────────────────────────┘
    s(
        {
            trig = "(%a)(%d)",
            regTrig = true,
            dscr = "Auto subscript single digit",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("<>_<>", {
            f(function(_, snip) return snip.captures[1] end),
            f(function(_, snip) return snip.captures[2] end),
        })
    ),
    s(
        {
            trig = "(%a)_(%d%d)",
            regTrig = true,
            dscr = "Auto subscript double digit",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("<>_{<>}", {
            f(function(_, snip) return snip.captures[1] end),
            f(function(_, snip) return snip.captures[2] end),
        })
    ),
    s(
        {
            trig = "__",
            wordTrig = false,
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("_{<>}", { i(1) })
    ),
    s(
        {
            trig = "^^",
            wordTrig = false,
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("^{<>}", { i(1) })
    ),
    --  ┌──────────┐
    --  │ Brackets │
    --  └──────────┘
    s(
        {
            trig = ";(",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("\\left( <> \\right)", { d(1, get_visual) })
    ),
    s(
        {
            trig = ";[",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("\\left[ <> \\right]", { d(1, get_visual) })
    ),
    s(
        {
            trig = ";{",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("\\left\\{ <> \\right\\}", { d(1, get_visual) })
    ),
    --  ┌──────┐
    --  │ Text │
    --  └──────┘
    s(
        {
            trig = "\\rm",
            snippetType = "autosnippet",
            condition = in_math,
        },
        fmta("\\mathrm{<>}", { i(1) })
    ),
}
