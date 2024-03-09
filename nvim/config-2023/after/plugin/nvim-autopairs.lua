local ap = require("nvim-autopairs")
ap.setup()

local Rule = require("nvim-autopairs.rule")

ap.add_rule(Rule("$", "$", "tex"))
ap.add_rule(Rule("`", "'", "tex"))
