local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = {omit = {"gl"}},
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"eslint",
})

-- Keybindings
lsp.on_attach(function (client, bufnr)
    local opts = {buffer = bufnr}

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
end)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

