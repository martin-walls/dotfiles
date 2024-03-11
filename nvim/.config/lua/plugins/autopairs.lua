return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local autopairs = require("nvim-autopairs")
        autopairs.setup({})

        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        -- Insert brackets after autocompleting a function/method
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        local Rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")

        -- Typst rules
        autopairs.add_rule(Rule("*", "*", "typst"):with_pair(cond.not_after_regex("%w")))
        autopairs.add_rule(Rule("_", "_", "typst"):with_pair(cond.not_after_regex("%w")))
    end,
}