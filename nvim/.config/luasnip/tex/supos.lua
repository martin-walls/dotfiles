local in_text = require("mrw.luasnip-utils").latex.in_text
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local function line_begin_and_in_text(line_to_cursor, matched_trigger, captures)
    return line_begin(line_to_cursor, matched_trigger, captures)
        and in_text()
end

-- Supo-specific snippets
return {
    s(
        {
            trig = "examq",
            dscr = "Exam question environment",
            condition = line_begin_and_in_text,
        },
        fmta(
            [[
                % <> Paper <> Question <>
                \begin{examquestion}{<>}{<>}{<>}
                <>
                \end{examquestion}
            ]],
            {
                i(1), i(2), i(3),
                rep(1), rep(2), rep(3),
                i(0),
            }
        )
    ),
    s(
        {
            trig = "bqst",
            dscr = "Question environment",
            condition = line_begin_and_in_text,
        },
        fmta(
            [[
                \begin{question}[<> marks]
                <>
                \end{question}
            ]],
            {
                i(1),
                i(0),
            }
        )
    ),
    s(
        {
            trig = "bnqst",
            dscr = "Question environment, without marks",
            condition = line_begin_and_in_text,
        },
        fmta(
            [[
                \begin{question}
                <>
                \end{question}
            ]],
            {
                i(0),
            }
        )
    ),
}
