local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = { omit = { "gr", "gi", "gd", "go" } },
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.on_attach(function(_, bufnr)
    -- Format on save
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

-- Mappings to move between diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
