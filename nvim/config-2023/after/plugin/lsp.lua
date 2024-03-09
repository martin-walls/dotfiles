local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = { omit = { "gr", "gi", "gd", "go" } },
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "lua_ls",
    "jdtls",
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.on_attach(function(_, bufnr)
    -- Format on save
    -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    --     group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
    --     buffer = bufnr,
    --     callback = function()
    --         vim.lsp.buf.format()
    --     end
    -- })

    -- Run formatter
    vim.keymap.set({ "n", "x" }, "<leader>f", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, { buffer = bufnr })

    -- rename symbol
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })

    -- code action
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
end)

lsp.configure("tsserver", {
    on_attach = function(client, bufnr)
        require("twoslash-queries").attach(client, bufnr)
    end
})

lsp.configure("typst_lsp", {
    settings = {
        exportPdf = "never"
    }
})

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = {
                    -- tell lua_ls where to find nvim lua files, for documentation etc.
                    unpack(vim.api.nvim_get_runtime_file("", true))
                }
            }
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

-- Mappings to move between diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)