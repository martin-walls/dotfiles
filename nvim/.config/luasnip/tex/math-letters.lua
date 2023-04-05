local in_math = require("mrw.luasnip-utils").latex.in_math
local in_text = require("mrw.luasnip-utils").latex.in_text

return {
    --  ┌─────────────────┐
    --  │ Lowercase Greek │
    --  └─────────────────┘
    --  ┌───────────────┐
    --  │  In math mode │
    --  └───────────────┘
    s(
        { trig = ";;a", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\alpha"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;b", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\beta"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;d", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\delta"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;e", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\epsilon"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;ve", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\varepsilon"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;f", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\phi"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;g", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\gamma"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;k", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\kappa"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;l", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\lambda"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;m", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\mu"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;n", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\nu"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;p", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\pi"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;r", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\rho"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;q", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\theta"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;s", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\sigma"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;t", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\tau"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;o", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\omega"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;w", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\psi"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;D", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\Delta"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;F", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\Phi"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;G", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\Gamma"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;P", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\Pi"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;Q", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\Theta"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;S", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\Sigma"),
        },
        { condition = in_math }
    ),
    s(
        { trig = ";;O", snippetType = "autosnippet", wordTrig = false },
        {
            t("\\Omega"),
        },
        { condition = in_math }
    ),
    --  ┌──────────────┐
    --  │ In text mode │
    --  └──────────────┘
    s(
        { trig = ";;a", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\alpha$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;b", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\beta$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;d", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\delta$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;e", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\epsilon$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;ve", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\varepsilon$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;f", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\phi$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;g", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\gamma$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;k", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\kappa$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;l", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\lambda$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;m", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\mu$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;n", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\nu$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;p", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\pi$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;r", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\rho$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;q", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\theta$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;s", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\sigma$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;t", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\tau$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;o", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\omega$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;w", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\psi$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;D", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\Delta$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;F", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\Phi$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;G", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\Gamma$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;P", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\Pi$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;Q", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\Theta$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;S", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\Sigma$"),
        },
        { condition = in_text }
    ),
    s(
        { trig = ";;O", snippetType = "autosnippet", wordTrig = false },
        {
            t("$\\Omega$"),
        },
        { condition = in_text }
    ),
}
