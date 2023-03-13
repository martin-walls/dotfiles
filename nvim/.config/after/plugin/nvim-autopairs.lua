require("nvim-autopairs").setup()

local Rule = require("nvim-autopairs.rule")
local ap = require("nvim-autopairs")

ap.add_rule(Rule("$", "$", "tex"))
ap.add_rule(Rule("`", "'", "tex"))
