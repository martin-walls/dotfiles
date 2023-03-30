local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.chktex.with({
            -- Don't execute \input statements -- it was showing diagnostics for
            -- included files at the line numbers of that file in the current file...
            -- rather confusing and hard to find
            extra_args = { "--inputfiles=0" },
            -- Show error code as well as message, so it can be silenced via a line comment
            diagnostics_format = "[#{c}] #{m}",
        }),
        -- Python formatter
        null_ls.builtins.formatting.black,
    },
})
